//
//  Category.swift
//  Nike-Retail
//
//  Created by LogicAppSourceIO on 22/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.
//

import Foundation
import UIKit

//Later implement product -> polymorhpismorinheritance

class Category{

    //Mark: - Public Api
    
    //Model
    var category = [String]()
    var categoryName: String?
    var categoryUid: String?
    var numberOfProductsInCategory: Int?
    var featuredImage: UIImage!
    
    init(category: [String], categoryName: String, categoryUid: String, numberOfProductsInCategory: Int, featuredImage: UIImage!) {
        self.categoryName = categoryName
        self.categoryUid = categoryUid
        self.numberOfProductsInCategory = numberOfProductsInCategory
        self.featuredImage = featuredImage
    }
    
    //change this later instead of Static to Dynamic -> override with FIR Api
    
    //MARK: - Private
    static func createCategory() -> [Category] {
        return [ Category(category: ["category1"],categoryName: "Travel Gear", categoryUid: "232", numberOfProductsInCategory: 32, featuredImage: UIImage(named: "p2")!),Category(category: ["category2"],categoryName: "Clothes Gear", categoryUid: "232", numberOfProductsInCategory: 32, featuredImage: UIImage(named: "r1")), Category(category: ["category3"],categoryName: "Outdoor Gear", categoryUid: "232", numberOfProductsInCategory: 32, featuredImage: UIImage(named: "p2")!)]
    }
    
    
    
}
