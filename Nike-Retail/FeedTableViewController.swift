//
//  FeedTableViewController.swift
//  LogicShoppyIO 
//
//  Created by LogicAppSourceIO on 15/3/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.
//

import UIKit
import Firebase

class FeedTableViewController: UITableViewController
{
    var products: [Product]?
    
    struct Storyboard {
        static let feedProductCell = "FeedProductCell"
        static let showProductDetail = "ShowProductDetail"
        static let showWelcome = "ShowWelcome"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser == nil {
            self.performSegue(withIdentifier: Storyboard.showWelcome, sender: nil)
        } else {
            // start doing something with your user here.
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "FEED"
        fetchProducts()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Fetching from Firebase
    
    func fetchProducts()
    {
        Product.fetchProducts { (products) in
            self.products = products
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let products = products {
            return products.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewController.Storyboard.feedProductCell, for: indexPath) as! FeedProductCell

        if let products = products {
            let product = products[indexPath.row]
            cell.product = product
            cell.selectionStyle = .none
        }
        cell.delegate = self

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    fileprivate var selectedProduct: Product?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedProduct = products?[indexPath.row]
        performSegue(withIdentifier: Storyboard.showProductDetail, sender: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Storyboard.showProductDetail {
            if let productDetailTVC = segue.destination as? ProductDetailTVC {
                productDetailTVC.product = selectedProduct
            }
        }
    }
}

extension FeedTableViewController: DataEnteredDelegate {
    
    func userDidSelectFavProduct(_ product: Product, isAdded: Bool) { //
        guard let user = Auth.auth().currentUser, let productId = product.uid else { return }
        
        print("on click user ID  \(user.uid) \n on click product ID \(productId)")
        
        //Create new ref on firebase
        let ref = DTDatabaseReference.users(uid: user.uid).reference().child("shoppingcart")
        
    
        let key = ref.child("wishlist").childByAutoId().key
        let post = ["uid": user.uid,
                    "productId": productId]
        
        //Store product id <-> user id -> child values
        let childUpdates = ["/wishlist/\(key)":post,"/user-posts/\(user.uid)/\(key)/": post]
        ref.updateChildValues(childUpdates)
        print("Child update stored onto to FIR \(childUpdates)")
}


//
//
//    var products = [Product]()
//
//    let value = snapshot.value as? NSDictionary
//    let id = value?["ids"] as? String ?? ""
//    for childSnapshot in snapshot.children {
//
//    if let childSnapshot = childSnapshot as? DataSnapshot, let dictionary = childSnapshot.value as? [String: Any] {
//    let product = Product(dictionary: dictionary)
//
//    guard let ids = ref.child("wishlist").value(forKey: "ids") as? [String: Any] else { return }
//    products.append(product)
//
//    var newIds = ids
//    if isAdded {
//    newIds.append(productId)
//    } else {
//    newIds.remove(productId)
//    }
//    ref.child("wishlist").setValue(newIds, forKey: "ids")
//    }
//    }
//})












//extension FeedTableViewController: DataEnteredDelegate {
//
//    func userDidSelectFavProduct(_ product: Product, isAdded: Bool) {
//        guard let user = Auth.auth().currentUser, let productId = product.uid else { return }
//
//        print("on click user ID  \(user.uid) \n on click product ID \(productId)")
//
//        let ref = DTDatabaseReference.users(uid: user.uid).reference().child("shoppingcart").child("wishlist") // Instantiate
//
//        Database.database().reference().child("users").child("shoppingcart").child("wishlist").observeSingleEvent(of: .value, with: { snapshot in
//
//            print("Firebase observe request success \n ")
//            var products = [Product]()
//
//            for childSnapshot in snapshot.children {
//                print(snapshot.children)
//                if let childSnapshot = childSnapshot as? DataSnapshot, let dictionary = childSnapshot.value as? [String: Any] {
//                    let product = Product(dictionary: dictionary)
//
//                    print("prodcut from fire base observation \(product.name)")
//
//
//                    guard let ids = ref.child("wishlist").value(forKey: "ids") as? Set <String> else { return }
//                    products.append(product)
//                    print("Products appended")
//
//                    var newIds = ids
//                    if isAdded {
//                        newIds.insert(productId)
//                        print("Prodct \(productId) inserted")
//                    } else {
//                        newIds.remove(productId)
//                        print("Product \(productId) is removed")
//                    }
//                    ref.child("wishlist").setValue(newIds, forKey: "ids")
//                }
//            }
//        })
//
//
//        //        //oberseve single event
//        //        guard let ids = ref.value(forKey: "ids") as? Set<String> else {
//        //            return
//        //        }
//
//
//    }
//}







}















