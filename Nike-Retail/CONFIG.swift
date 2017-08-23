//
//  CONFIG.swift
//  Nike-Retail
//
//  Created by LogicAppSourceIO on 21/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.
//

import Foundation
import UIKit

/*********** NEAT FEATURES *****/
// CREATE SWITCH -> Theme
// Modify Categories Name ->
// Hook up API -> Backend Admin Panel
// API SHOWS PRICE SALES -> Emailed notification on Sale ->
// Users signup -> Upload -> Image -> Change categories
// Social Login/Signup
// Webview -> Display terms + instructions + read me + company info


/*
 **********************CONFIGURATION**********************
 
 1. Download your own Googleinfo.plist and simply drag it into the project
 2. Create an Account www.stripe.com - > Set UP STRIPE API KEYS
 3. Drago your logo into Assets.xcassets -> Change your name path to image under "logo"
 
 */

// CONSTANTS GLOBAL AVAILBE
let API_STRIPE_PUBLIC = ""      //Checkoutableviewcontroller -> PASS PARAMETER
let API_STRIPE_SECRET = ""     //Checkoutableviewcontroller -> PASS PARAMETER
let STRIPE_CALLBACK_URL = ""   //Checkoutableviewcontroller -> PASS PARAMETER



// Modify Logo
// Switch your own name of Image here ->
let logoCustom = "logicproduction" //Path -> logoImage in WelcomeViewController


// Terms & Conditions webview
let url_terms = ""




//Needs to implemnt to lin
//extension WebViewController {
//
//    init(html: String) {
//        super.init(nibName: nil, bundle: nil)
//
//        let webView = UIWebView(frame: self.view.bounds)
//        webView.loadHTMLString(html, baseURL: nil)
//        self.view.addSubview(view)
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(cder:) has not been implemented)
//    }
//
//
//    func didTapdone(){
//        self.navigationController.presentViewController.dissmis(animated: true, completion: nil)
//    }
//
//
//
//}
//
//
//






