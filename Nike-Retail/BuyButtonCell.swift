//
//  BuyButtonCell.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 5/5/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.
//

import UIKit

protocol BuyButtonCellDelegate: class
{
    func addToCart(_ product: Product)
}

class BuyButtonCell: UITableViewCell {

    @IBOutlet weak var buyButton: UIButton!
    
    weak var delegate: BuyButtonCellDelegate?
    
    var product: Product! {
        didSet {
            buyButton.setTitle("BUY FOR $\(product.price!)", for: [])
        }
    }
    
    @IBAction func buyButtonDidTap()
    {
        delegate?.addToCart(product)
    }

}

















