//
//  AppDelegate.swift
//  logicShoppyIO
//
//  Created by logicappsource on 4/29/17.
//  Copyright © 2017 LogicAppSourceIO All rights reserved.
//


 /************   Bug Fixes  **************/
 /* (1)
 (2) Popup Modal -- alert on added to cart - showing product + price
 (3) Buy button  - modaly rediret to checkout if products is added succc
 
 
****************** More Neat stuff **************************
**** Show order thank you page and confirmation page after the payment is successfully processed.
 
**** Save placed order to Firebase for store owner to process the order and users to manage them.
**** Create purchase history
**** Allow store owner to control inventory. This can be done within the app or you can have a separate client app that is for store owner only.
**** Add, edit products to the store.
**** Publish posts on the store feed.
 
**** Allow store owner to send mass push notification to users.
**** LIVE chat with store owner and customer support agents!  Socialize Your Apps' Messenger course.
**** API For clients dashboard to send out PUSH NOTFICAtiONS
**** Change Images on firebase with API - fetch directly from FIR or dashboard in the app from web
**** Building WishList
   */


import UIKit
import Firebase
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        configureAppearance()
        configureStripe()
//        testUploadProducts()

        return true
    }
    
    func configureStripe()
    {
        Stripe.setDefaultPublishableKey("pk_test_ecZTLtEOipOUqhftHrG8uEyf")
    }
    
    func testUploadProducts()
    {
        for product in Product.fetchProducts() {
            product.save({ (error) in
                print(error)
            })
        }
    }
    
    func configureAppearance()
    {
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = false
    }

}





 
