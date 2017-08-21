//
//  WishListCell.swift
//  Nike-Retail
//
//  Created by LogicAppSourceIO on 21/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.
//

import UIKit

class WishListCell: UITableViewCell {
    
    
    // Iboutlets to cell
    // Cell = product

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Reload Data
    }
    
    var product: Product? {
        didSet {
            productName.text = product?.name
            productPrice.text =  "$ \(product?.price)"
            print(" this is the new wihslsit price \(productName)   new price \(productPrice)" )
        }
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
