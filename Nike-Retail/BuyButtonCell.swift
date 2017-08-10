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






//extension BuyButtonCell: UIAlertViewDelegate {
//
//    func alertUser(_ title: String, message: String, buttonTitle: String) {
//
//        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil )
//        alertVC.addAction(action)
//        alertVC.present(alertVC, animated: true, completion: nil)
//    }
//
//
//}
//



