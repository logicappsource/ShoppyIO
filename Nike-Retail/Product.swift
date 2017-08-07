//
//  Product.swift
//  LogicShoppyIO
//
//  Created by logicappsource on 5/2/17.
//  Copyright © 2017 logicappsource All rights reserved.
//
import UIKit
import Firebase

class Product
{
    var uid: String?
    var name: String?
    var images: [UIImage]?
    var price: Double?
    var description: String?
    var detail: String?
    var relatedProductUIDs: [String]?
    
    var imageLinks: [String]?
    var featuredImageLink: String?
    
    init(uid: String?, name: String?, images: [UIImage]?, price: Double?, description: String?, detail: String?, relatedProductUIDs : [String]? = ["875942-100", "880843-003", "384664-113", "805144-852"])
 {
        self.uid = uid
        self.name = name
        self.images = images
        self.price = price
        self.description = description
        self.detail = detail
        self.relatedProductUIDs = relatedProductUIDs
    }
    
    class func fetchProducts() -> [Product]
    {
        var shoes = [Product]()
        
        // 1
        var shoe1Images = [UIImage]()
        for i in 1...8 {
            shoe1Images.append(UIImage(named: "s\(i)")!)
        }
        let shoe1 = Product(uid: "875942-100", name: "NIKE AIR MAX 1 ULTRA 2.0 FLYKNIT", images: shoe1Images, price: 180, description: "LIGHTER THAN EVER! The Nike Air Max 1 Ultra 2.0 Flyknit Men's Shoe updates the iconic original with an ultra-lightweight upper while keeping the plush, time-tested Max Air cushioning.", detail: "LIGHTER THAN EVER! The Nike Air Max 1 Ultra 2.0 Flyknit Men's Shoe updates the iconic original with an ultra-lightweight upper while keeping the plush, time-tested Max Air cushioning.")
        shoes.append(shoe1)
        
        // 2
        var shoe2Images = [UIImage]()
        for i in 1...7 {
            shoe2Images.append(UIImage(named: "t\(i)")!)
        }
        let shoe2 = Product(uid: "880843-003", name: "NIKE FREE RN FLYKNIT 2017", images: shoe2Images, price: 120, description: "The Nike Free RN Flyknit 2017 Men's Running Shoe brings you miles of comfort with an exceptionally flexible outsole for the ultimate natural ride. Flyknit fabric wraps your foot for a snug, supportive fit while a tri-star outsole expands and flexes to let your foot move naturally.", detail: "The Nike Free RN Flyknit 2017 Men's Running Shoe brings you miles of comfort with an exceptionally flexible outsole for the ultimate natural ride. Flyknit fabric wraps your foot for a snug, supportive fit while a tri-star outsole expands and flexes to let your foot move naturally.")
        shoes.append(shoe2)
        
        
        // 3
        var shoe3Images = [UIImage]()
        for i in 1...6 {
            shoe3Images.append(UIImage(named: "j\(i)")!)
        }
        let shoe3 = Product(uid: "384664-113", name: "AIR JORDAN 6 RETRO", images: shoe3Images, price: 190, description: "The Air Jordan 6 Retro Men's Shoe celebrates a championship heritage with design lines and plush cushioning inspired by the ground-breaking hoops original.", detail: "The Air Jordan 6 Retro Men's Shoe celebrates a championship heritage with design lines and plush cushioning inspired by the ground-breaking hoops original.")
        shoes.append(shoe3)
        
        // 4
        var shoe4Images = [UIImage]()
        for i in 1...6 {
            shoe4Images.append(UIImage(named: "f\(i)")!)
        }
        let shoe4 = Product(uid: "805144-852", name: "TECH FLEECE WINDRUNNER", images: shoe4Images, price: 130, description: "The Nike Sportswear Tech Fleece Windrunner Men's Hoodie is redesigned for cooler weather with smooth, engineered fleece that offers lightweight warmth. Bonded seams lend a modern update to the classic chevron design.", detail: "The Nike Sportswear Tech Fleece Windrunner Men's Hoodie is redesigned for cooler weather with smooth, engineered fleece that offers lightweight warmth. Bonded seams lend a modern update to the classic chevron design.")
        shoes.append(shoe4)
        
        return shoes
    }
}

// MARK: - Firebase
extension Product
{
    var ref: FIRDatabaseReference! {
        get {
            if let uid = self.uid {
                return DatabaseReference.products(uid: uid).reference()
            } else {
                return nil
            }
        }
    }
    
//
//    convenience init(dictionary: [String: Any])
//    {
//        let uid = dictionary["uid"] as? String
//        let name = dictionary["name"] as? String
//        let price = dictionary["price"] as? Double
//        let description = dictionary["description"] as? String
//        let detail = dictionary["detail"] as? String
//        let images = dictionary["images"] as? String
//        let relatedProductUIDs = dictionary["relatedProductsUIDs"] as? [String]
//
//        var imgLinks = [String]()
//        if let imgLinkDict = dictionary["images"] as? [String: Any]
//        {
//            for (_ , imgLink) in imgLinkDict {
//                imgLinks.append(imgLink as! String)
//            }
//        }
//
//            self.init(uid: uid, name: name, images: nil, price: price, description: description, detail: detail, relatedProductUIDs: relatedProductUIDs)
//            self.imageLinks = imgLinks
//            self.featuredImageLink = imgLinks[0]
//    }
//
//
//
//    class func fetchProducts(completion: @escaping ([Product]) -> Void )
//    {
//        FIRDatabase.database().reference().child("products").observeSingleEvent(of: .value, with: { (snapshot) in
//            var products = [Product]()
//
//            for childSnapshot in snapshot.children {
//                print(childSnapshot)
//                if let childSnapshot = childSnapshot as? FIRDataSnapshot, let dictionary = childSnapshot.value as? [String: Any] {
//                    //TODO: Dicitionary , turn dictionary to local instance of product
//                    let product = Product(dictionary: dictionary)
//                    //TODO2: Append the product into products
//                    products.append(product)
//                }
//            }
//            completion(products)
//        })
//    }
    
    convenience init(dictionary: [String : Any])
    {
        let uid = dictionary["uid"] as? String
        let name = dictionary["name"] as? String
        let price = dictionary["price"] as? Double
        let description = dictionary["description"] as? String
        let detail = dictionary["detail"] as? String
        let relatedProductUIDs = dictionary["relatedProductUIDs"] as? [String]
        
        var imgLinks = [String]()
        if let imgLinkDict = dictionary["images"] as? [String : Any] {
            for (_, imgLink) in imgLinkDict {
                imgLinks.append(imgLink as! String)
            }
        }
        
        self.init(uid: uid, name: name, images: nil, price: price, description: description, detail: detail, relatedProductUIDs: relatedProductUIDs)
        self.imageLinks = imgLinks
        //self.featuredImageLink = imgLinks[0]   -- later implementation
    }
    
    
    
    
    class func fetchProducts(completion: @escaping ([Product]) -> Void)
    {
        FIRDatabase.database().reference().child("products").observeSingleEvent(of: .value, with: { snapshot in
            
            var products = [Product]()
            
            for childSnapshot in snapshot.children {
                if let childSnapshot = childSnapshot as? FIRDataSnapshot, let dictionary = childSnapshot.value as? [String : Any] {
                    // TODO: dictionary, need to turn the dictionary into a local instance of PRoduct
                    let product = Product(dictionary: dictionary)
                    // TODO 2: append the product into products
                    products.append(product)
                }
            }
            
            completion(products)
        })
    }
    
    
    
    
    //  two roles: (1) customers;; (2) admin, store owners
    // (2) admin: upload products, edit products, magnage inventory, manage purchases
    // (1) customers: browse products, make a purchase, see purchase history, cancel a purchase...
    // DO NEED PRODUCTS
    // A - create some prototype products locally
    // B - upload the products programmatically
    // C - fetch those products into customer's feed
    
    // 1. create a new product in our app
    
    func save(completion: @escaping (Error?) -> Void)
    {
        // save images to FB stroage with the productUID
        if let images = images {
            for image in images {
                let firImage = FIRImage(image: image)
                let randomID = ref.childByAutoId().key
                firImage.save(randomID, completion: { (error) in
                    // save the image downloadURI to product database
                    self.ref.child("images").childByAutoId().setValue(firImage.downloadURI!)
                    completion(error)
                })
            }
        }
        
        self.ref.setValue(toDictionary())
    }
    
    func toDictionary() -> [String : Any]
    {
        guard let uid = self.uid, let name = self.name, let price = price, let description = description, let detail = detail, let relatedProductUIDs = relatedProductUIDs else {
            return [:]
        }
        
        return [
            "uid" : uid,
            "name" : name,
            "price" : price,
            "description" : description,
            "detail" : detail,
            "relatedProductUIDs" : relatedProductUIDs
            // "featuredImageLink" : imageLinks![0]    -- later implementtation
            
        ]
    }
}














