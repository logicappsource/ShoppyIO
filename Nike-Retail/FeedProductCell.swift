//
//  FeedProductCell.swift
//   LogicShoppyIO
//
//  Created by logicappsource on 5/2/17.
//  Copyright © 2017 logicappsource. All rights reserved.
//

import UIKit

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
            productImageView.image = product.images?.first
            productNameLabel.text = product.name
            productPriceLabel.text = "\(product.price!)"
        }
    }

}
























