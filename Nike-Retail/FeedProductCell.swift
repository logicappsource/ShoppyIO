//
//  FeedProductCell.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 5/2/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

// Caching
// Core Data
// SAMCache
// Firebase offline mode

class FeedProductCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var product: Product? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI()
    {
        if let product = product {
            
            // download the product image
            productImageView.image = nil
            if let imageLinks = product.imageLinks, let imageLink = imageLinks.first {
                FIRImage.downloadImage(uri: imageLink, completion: { (image, error) in
                    if error == nil {
                        self.productImageView.image = image
                    }
                })
            }
            
            productNameLabel.text = product.name
            productPriceLabel.text = "$\(product.price!)"
        }
    }
    

    //Fav icon - on click -
    @IBAction func favroiteProductBtn(_ sender: Any) { //Pass product id
      
        let userUID = Auth.auth().currentUser!.uid
            print(userUID)
        let ref = DTDatabaseReference.users(uid: userUID).reference().child("shoppingcart").child("wishlist") // Instantiate new child val to FIR
        
        //Not finished -->  Missing here !
        
        //Store data to firebsae  - userUID + productUID
        ref.child("users").child("shoppingCart").child("wishlist").setValue(["userUID": userUID])
        
        //Detect cell that has been click  -> didselectrowatindexpath
        

        
        //Alert the user
    }

}



















