//
//  WelcomeViewController.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO on 11/8/17.
//  Copyright © 2016 LogicAppSourceIO. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let _ = user {
                self.dismiss(animated: false, completion: nil)
            } else {
                
            }
        })
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}












