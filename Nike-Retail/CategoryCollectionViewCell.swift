//
//  CategoryCollectionViewCell.swift
//  Nike-Retail
//
//  Created by LogicAppSourceIO on 22/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Public API
    var category: Category! {
        didSet {
            updateUI()
        }
    }
    

    //MARK: -  Private
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!

    
    func updateUI() {
    categoryTitleLbl.text! = category.categoryName!
    featuredImageView.image = category.featuredImage
    }
    
    
    
    
    
}
