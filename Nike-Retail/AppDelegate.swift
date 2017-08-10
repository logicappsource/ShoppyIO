//
//  AppDelegate.swift
//  logicShoppyIO
//
//  Created by logicappsource on 4/29/17.
//  Copyright © 2017 LogicAppSourceIO All rights reserved.
//

/* Missing  Implementation --> Completion */
 
 
 /************   Bug Fixes  **************/
 /*
 (1) Login + Signup
 (2) Download image for ProductImageViewController from an imageLink  ===> at least 15 minutes
 (3)Implement dynamic product suggestions
 
 * We have an array of related product UIDs for each product
 * Get these related products from either locally (you already downloaded it) or you have to download it now
 * Populate these images into your UICollectionViewDataSource
 * When the user taps on a related product thumbnial, he/she goes to the related product's detail screen
 * Share your Code Challenge in the comment section
 ==> at least 1hour to 3 hours
 
 (1) Design check out UI in Storyboard using Static Table View Controller
 (2) Connect its UI elements to according IBOutlets
 
 More Neat stuff
**** Show order thank you page and confirmation page after the payment is successfully processed.
**** Save placed order to Firebase for store owner to process the order and users to manage them.
**** Create purchase history
**** Allow store owner to control inventory. This can be done within the app or you can have a separate client app that is for store owner only.
**** Add, edit products to the store.
**** Publish posts on the store feed.
**** Allow store owner to send mass push notification to users.
**** LIVE chat with store owner and customer support agents! You'll learn how to do this in Socialize Your Apps' Messenger course.
**** API For clients dashboard to send out PUSH NOTFICAtiONS
**** Change Images on firebase with API - fetch directly from FIR or dashboard in the app from web
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





 
