//
//  ShoppingCartItemCell.swift
//  logicShoppyIO
//
//  Created by LogicAppSourceIO on 5/4/17.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

class ShoppingCartItemCell: UITableViewCell
{
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var product: Product! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI()
    {
        // 16-Challenge-5: Fetch the product featured image
        productImageView.image = nil
        if let imageLink = product.featuredImageLink {
            FIRImage.downloadImage(uri: imageLink, completion: { (image, error) in
                self.productImageView.image = image
            })
        }
        
        productNameLabel.text = product.name
        priceLabel.text = "$\(product.price!)"
    }
    
}



















