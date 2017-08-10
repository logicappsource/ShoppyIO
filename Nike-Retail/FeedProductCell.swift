//
//  FeedProductCell.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 5/2/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.
//

import UIKit

// Caching
// Core Data
// Realm
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

}


























