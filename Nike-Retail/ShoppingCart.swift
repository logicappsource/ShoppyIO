//
//  ShoppingCart.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO on 07/08/2017.
//  Copyright © 2017 logicappsource. All rights reserved.
//

import Foundation
import Firebase

private let caTaxPercentage = 0.08
private let freeShippingLimit = 50.00
private let defaultShippingFee = 5.99

class ShoppingCart
{
    var products: [Product]?
    var shipping: Double?
    var subtotal: Double?
    var tax: Double?
    var total: Double?
    
    class func add(product: Product)
    {
        let userUID = FIRAuth.auth()!.currentUser!.uid
        let ref = DatabaseReference.users(uid: userUID).reference().child("shoppingCart")
        
        ref.runTransactionBlock({ (currentData: FIRMutableData) -> FIRTransactionResult in
            
            // the last-known state of the current shopping cart, nil if there's none shopping cart
            
            var cart = currentData.value as? [String : Any] ?? [:]
            var productDictionary = cart["products"] as? [String : Any] ?? [:]
            
            // add the new product to the dictionary
            productDictionary[product.uid!] = product.toDictionary()
            
            // re-calculate the detail of the shoppping cart - total, subtotal, shipping, tax
            
            var subtotal: Double = 0
            var shipping: Double = 0
            var tax: Double = 0
            var total: Double = 0
            
            for (_, prodDict) in productDictionary {
                if let prodDict = prodDict as? [String : Any] {
                    let price = prodDict["price"] as! Double
                    subtotal += price
                }
            }
            
            if subtotal >= freeShippingLimit || subtotal == 0 {
                shipping = 0
            } else {
                shipping = defaultShippingFee
            }
            
            tax = (subtotal + shipping) * caTaxPercentage
            total = subtotal + shipping + tax
            
            // update back the values to cart
            cart["subtotal"] = subtotal
            cart["shipping"] = shipping
            cart["tax"] = tax
            cart["total"] = total
            cart["products"] = productDictionary
            
            // return back the value of the currentData as the new updated cart - so we can upload this to our firebase
            currentData.value = cart
            
            return FIRTransactionResult.success(withValue: currentData)
            
        }) { (error, committed, snapshot) in
            if let error = error {
                // Code Challenge: report the error to the user -- alert view
                print(error.localizedDescription)
                print("Eror not sent data to FIREBASE ")
            }
        }
    }
}
