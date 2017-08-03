//
//  WelcomeViewController.swift
// LogicShoppyIO
//
//  Created by logicappsource on 11/3/16.
//  Copyright © 2017 logicappsource All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
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












