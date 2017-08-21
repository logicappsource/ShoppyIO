//
//  WishListTableViewController.swift
//  Nike-Retail
//
//  Created by LogicAppSourceIO on 17/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.

import UIKit
import Firebase

class WishListTableViewController: UITableViewController {
    
    var wishListUserProduct = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshData()
        
    }
    
    func refreshData() {
        guard let user = Auth.auth().currentUser else { return }
        let ref = DTDatabaseReference.users(uid: user.uid).reference().child("shoppingcart").child("wishlist")
        
        guard let ids = ref.value(forKey: "ids") as? Set<String> else { // To dict instead -> Set<String>
            return
        }
        
        //Fetching all products -> Future impl- change to one product only id = id
        Product.fetchProducts { (products) in
            var productsInWishlist: [Product] = []
            for product in products {
                guard let id = product.uid, ids.contains(id) else { continue }
                productsInWishlist.append(product)
            }
            self.wishListUserProduct = productsInWishlist
        }
    }
    
    
    
    func fetchProductsUid(_ completion: @escaping ([Product]) -> Void ) {
        
        Database.database().reference().child("products").observeSingleEvent(of: .value, with: { snapshot in
            
             var products = [Product]()
            
            for childSnapshot in snapshot.children {
                if let childSnapshot = childSnapshot as? DataSnapshot, let dictionary = childSnapshot.value as? [String: Any] {
                    let product = Product(dictionary: dictionary)
                    products.append(product)
                    print(products)
                }
            }
        })
    }
    

    
    // read from firebase ref -> wishlist
    // fetch product Id -> user id
    // if (productID == backendProductID)
    //Display in [] -> table cells
    
    func fetchWishListUser() {
        //Fecth data user uID
        //Ref.child
        //snapshop children
        //loop
        
    }
    


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishListUserProduct.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //   6.  Load date into table view
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishListCell", for: indexPath) as! WishListCell //Casted as cell
        // Configure the cell. -> Wish List Cell
        let product = wishListUserProduct[indexPath.row]
        cell.textLabel?.text = product.name
        return cell
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

}

extension WishListTableViewController: UIAlertViewDelegate{
    
    func alertUser(title: String, message: String, btnTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: title, style: .default, handler: nil)
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}


/****
 2  Bool - >  (show icon filled - unfilled if products inside)
 2.1. Display alert of product added to wishist -> AlertView.
 3.  Get image/price of the product
 4.  Store on Firebase
 5.  Fetch from Firebase
 6.  Load date into table view
 7. Return table cell  -> count ->
 *****/

//2.1 Bool - modify to true if on click.
//    let iconFilled: Bool = false

//2.. UI alert controller + view

//3. Get image/price of the product  . product.price , product.detal, product.uid

//4. setValue()  ref.child("users").child("shoppingcart").("wishlist") -> Product.uid -> FIRuser.uid

//5. .observesingleEvent -> ref.child("users").child("shoppingcart").("wishlist") -> Product.uid -> FIRuser.uid

