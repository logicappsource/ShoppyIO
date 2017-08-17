//
//  CartTotalCell.swift
//  LogicShoppyIO
//
//  Created by LogicAppSource on 6/18/17.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

// 16-Challenge-7: Create cart total cell

class CartTotalCell: UITableViewCell
{
    @IBOutlet weak var totalAmountLabel: UILabel!

    var shoppingCart: ShoppingCart! {
        didSet {
            totalAmountLabel.text = "$\(shoppingCart.total!)"
        }
    }
}
