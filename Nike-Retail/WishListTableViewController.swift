//
//  WishListTableViewController.swift
//  Nike-Retail
//
//  Created by LogicAppSourceIO on 17/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.

import UIKit
import Firebase

class WishListTableViewController: UITableViewController {
    
    //Initliazaing empty array
    var wishListUserProduct = [Product]()
    var wishListUserIds = [User]()
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //load data here into cells
      
    }
    
    /****
    2. Click fave. icon -> global func  addToWishList(productId, userID)
    2.3  Bool - >  (show icon filled - unfilled if products inside)
    2.4 Display alert of product added to wishist -> AlertView.
    3.  Get image/price of the product
    3.  Store on Firebase
    4.  Fetch from Firebase
    5.  Load date into table view
    6. Return table cell  -> count ->
    *****/

    
    
    
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
    
    
    
    
    func fetchWishListUser() {
        //Fecth data user uID
        //Ref.child
        //snapshop children
        //loop
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //wishListProduct.count
        return wishListUserProduct.count  // Dynamic -> instead of static 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! WishListCell //Casted as cell
        // Configure the cell. -> Wish List Cell
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
