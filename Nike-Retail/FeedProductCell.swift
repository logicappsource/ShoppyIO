//
//  FeedProductCell.swift
//   LogicShoppyIO
//
//  Created by logicappsource on 5/2/17.
//  Copyright © 2017 logicappsource. All rights reserved.
//

import UIKit

class FeedProductCell: UITableViewCell {
    
    
    //Caching
    //Core Data
    //Realm
    //SAMCache
    

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
            //Download the product image
            productImageView.image = nil
            if let imageLinks = product.imageLinks, let imageLink = imageLinks.first {
                FIRImage.downloadImage(uri: imageLink, completion: { (image, error) in
                    if error == nil {
                        self.productImageView.image = image
                        
                    }
                })
            }
            
            
            productImageView.image = product.images?.first
            productNameLabel.text = product.name
            productPriceLabel.text = "$\(product.price!)"
        }
    }

}
























