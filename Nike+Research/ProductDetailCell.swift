//
//  ProductDetailCell.swift
//  Nike+Research
//
//  Created by LogicAppSourceIO on 20/06/2017.
//  Copyright © 2017 Developers Academy. All rights reserved.
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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
