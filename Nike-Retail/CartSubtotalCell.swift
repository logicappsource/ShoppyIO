//
//  CartSubtotalCell.swift
//  LogicShoppyIO
//
//  Created by LogicAppSource on 6/18/17.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

// 16-Challenge-6: Create cart subtotal cell

class CartSubtotalCell: UITableViewCell {

    var shoppingCart: ShoppingCart! {
        didSet {
            subtotalLabel.text = "$\(shoppingCart.subtotal!)"
            shippingCostLabel.text = shoppingCart.shipping! == 0 ? "FREE" : "$\(shoppingCart.shipping!)"
            taxAmountLabel.text = "$\(shoppingCart.tax!)"
        }
    }
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var shippingCostLabel: UILabel!
    @IBOutlet weak var taxAmountLabel: UILabel!
}
