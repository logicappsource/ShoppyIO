//
//  ProductDetailCell.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 5/2/17.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!

    var product: Product? {
        didSet {
            productNameLabel.text = product?.name
            productDescriptionLabel.text = product?.description
        }
    }
}

















