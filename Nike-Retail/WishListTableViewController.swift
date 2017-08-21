//
//  WishListTableViewController.swift
//  Nike-Retail
//
//  Created by LogicAppSourceIO on 17/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.

//Store later in user cache ->  NSuserdefaults

import UIKit
import Firebase

class WishListTableViewController: UITableViewController {
    
    var wishListUserProducts = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
        //Fetch observe data child from FIREBASE
    func refreshData() { //_ completion: @escaping ([Product]) -> Void

         //Error handling
        guard let user = Auth.auth().currentUser else { return }
        
        //Init Ref
        DTDatabaseReference.users(uid: user.uid).reference().child("shoppingcart").child("wishlist").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let snapshot = snapshot.value as? [DataSnapshot] { return }
            
                for childSnapshot in snapshot.children {
                    if let childSnapshot = childSnapshot as? DataSnapshot, let dictionary = childSnapshot.value as? [String: Any] {
                       
                        let userID = dictionary["uid"] as? String  ?? ""
                    
                        if Auth.auth().currentUser?.uid ==  userID {  //Match User  ID
                       
                             var wishListUserArray = [String]()     //Init
                            
                            //Product ID from Backend
                            let productID  = dictionary["productId"] as? String ?? ""
                            print( "Matching userID from Frontend to Backend ->  \(userID) +  atching productID from Frontend to Backend ->  \(productID) ")
                            
                            let product = Product(dictionary: dictionary)
                            self.wishListUserProducts.append(product)

                            
                            //Fetch Products
                            Product.fetchProducts({ (products) in
                                for product in products {
                                    guard let id = product.uid  else { return }
                                    
                                    //If id from backend is == frontend
                                    if productID == product.uid {
                                        self.wishListUserProducts.append(product)
                                        self.alertUser(title: "SuccessFully", message: "Added productID \(productID)", btnTitle: "OK")
                                    }
                                }
                            })
                        
                        }
                    }
                }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishListUserProducts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //   6.  Load date into table view
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishListCell", for: indexPath) as! WishListCell //Casted as cell
       
        // Configure the cell. -> Wish List Cell
        let product = wishListUserProducts[indexPath.row]
        cell.textLabel?.text = product.name
        return cell
    }

}


extension WishListTableViewController {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete) {
            
            //Display Alert
            if let product = wishListUserProducts[indexPath.item] as? Product {
               //Handle deleting
                wishListUserProducts.remove(at: indexPath.item)
            }
            self.tableView.reloadData()
        }
    }
    
}


extension WishListTableViewController: UIAlertViewDelegate{
    
    func alertUser(title: String, message: String, btnTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: title, style: .default, handler: nil)
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



//    func fetchProductsUid(_ completion: @escaping ([Product]) -> Void ) {
//
//        Database.database().reference().child("products").observeSingleEvent(of: .value, with: { snapshot in
//
//             var products = [Product]()
//
//            for childSnapshot in snapshot.children {
//                if let childSnapshot = childSnapshot as? DataSnapshot, let dictionary = childSnapshot.value as? [String: Any] {
//                    let product = Product(dictionary: dictionary)
//                    products.append(product)
//                    print(products)
//                }
//            }
//        })
//    }


//    func refreshData() {
//        guard let user = Auth.auth().currentUser else { return }
//        let ref = DTDatabaseReference.users(uid: user.uid).reference().child("shoppingcart").child("wishlist")
//
//        guard let ids = ref.value(forKey: "ids") as? Set<String> else { // To dict instead -> Set<String>
//            return
//        }
//
//        //Fetching all products -> Future impl- change to one product only id = id
//        Product.fetchProducts { (products) in
//            var productsInWishlist: [Product] = []
//            for product in products {
//                guard let id = product.uid, ids.contains(id) else { continue }
//                productsInWishlist.append(product)
//            }
//            self.wishListUserProduct = productsInWishlist
//        }
//    }






//Fetching all products -> Future impl- change to one product only id = id
//        Product.fetchProducts { (products) in
//            var productsInWishlist: [Product] = []
//            for product in products {
//                guard let id = product.uid, ids.contains(id) else { continue }
//                productsInWishlist.append(product)
//            }
//            self.wishListUserProduct = productsInWishlist
//        }
//    }


//Compare two arrays if containing same id  = display to table cell

//                            for id1 in wishListUserArray {
//                                for id2 in self.wishListUserProduct {
//                                    if id1 == id2 {
//                                        //Apend that [id] to 3 array finalWishlist
//                                    } else {
//                                        //print false
//                                    }
//                                }
//                            }
//
// append specific productID to [wishlistarray]


