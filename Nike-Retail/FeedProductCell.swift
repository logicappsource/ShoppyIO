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
import GoogleSignIn

// Caching
// Core Data
// SAMCache
// Firebase offline mode
// Google Sign in

protocol DataEnteredDelegate: class{
    func userDidSelectFavProduct(_ product: Product, isAdded: Bool)
}



class FeedProductCell: UITableViewCell {
    
    var delegate: DataEnteredDelegate?

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
    
    
    
       //1. Click fav. icon ->  func  addToWishList(productId, userID)
    @IBAction func favroiteProductBtn(_ sender: UIButton) { //Pass product id
        
        guard let product = product else { return }
        sender.isSelected = !sender.isSelected
        delegate?.userDidSelectFavProduct(product, isAdded: sender.isSelected)
    }

}




//extension FeedProductCell: UIAlertViewDelegate {
//
//
//    func alertUser(title: String, message: String, btnTitle: String) {
//         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//         let action = UIAlertAction(title: title, style: .default, handler: nil)
//
//        alertController.addAction(action)
//        present(alertController,animated: true, completion: nil)
//
//    }
//
//
//}
//
//
//














