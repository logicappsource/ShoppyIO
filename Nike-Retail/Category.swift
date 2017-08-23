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
    var categoryName: String?
    var categoryUid: String?
    var numberOfProductsInCategory: Int?
    var featuredImage: UIImage!
    
    init(categoryName: String, categoryUid: String, numberOfProductsInCategory: Int, featuredImage: UIImage!) {
        self.categoryName = categoryName
        self.categoryUid = categoryUid
        self.numberOfProductsInCategory = numberOfProductsInCategory
        self.featuredImage = featuredImage
    }
    
//    override init(uid: String?, name: String?, images: [UIImage]?, price: Double?, description: String?, detail: String?, relatedProductUIDs: [String]?) {
//        self.uid = uid
//        self.name = name
//        self.images = images
//        self.price = price
//        self.description = description
//        self.detail = detail
//        self.relatedProductUIDs = relatedProductUIDs
//    }
    
    //Initializer
    
    //MARK: - Private
    static func createCategory() -> [Category] {
        return [ Category(categoryName: "Travel Gear", categoryUid: "232", numberOfProductsInCategory: 32, featuredImage: UIImage(named: "p2")!),Category(categoryName: "Travel Gear", categoryUid: "232", numberOfProductsInCategory: 32, featuredImage: UIImage(named: "p2"))]
    } //change this later instead of Static to Dynamic -<
    
    
    
}
