//
//  AppDelegate.swift
//  logicShoppyIO
//
//  Created by logicappsource on 4/29/17.
//  Copyright © 2017 LogicAppSourceIO All rights reserved.
//

 /*
 
 (2) Popup Modal -- alert on added to cart - showing product + price
 
 // Custom Alert ----> present style over fullscreen
 // Custom wdw follow apple conv.
 // Animations - loading spinner
 // UI kit animations -- core animations // bakrgound fade in
 // Cross fade  ->
 // Custom transition  rey wenderlich -->
 
 // Cashier -- caching - FIREBAsE cashing frame


 

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
**** Building WishList
   */

import UIKit
import Firebase
import Stripe
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        configureAppearance()
        configureStripe()
//        testUploadProducts()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    

    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
        }
    

    //To Run in iOS 8 and oldere
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
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





 
