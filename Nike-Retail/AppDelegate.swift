//
//  AppDelegate.swift
//  LogishoppingIO
//
//  Created by logicappsource on 4/29/17.
//  Copyright © 2017 logicappsource. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FIRApp.configure()
        configureAppearance()
        
        //Products Localy 
        let products = Product.fetchProducts()
        for product in products {
            product.save(completion: { (error) in
                
            })
        }
        
        Product.fetchProducts { (products) in
            print(products)
        }
        
        return true
    }
    
    func configureAppearance()
    {
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = false
    }

}

























