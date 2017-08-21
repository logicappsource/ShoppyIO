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
    
    
    //Adding more functionality check if the user i currenty logged in -> automatic segue to Navigation controller
    
    @IBOutlet weak var logoImage: UIImageView! //Should be customizable in CONFIG file
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let _ = user {
                self.dismiss(animated: false, completion: nil)
            } else {
                
            }
        })
        
        //Set up logo reference from CONFIG file
        var image: UIImage = UIImage(named: "\(logoCustom)")!
        self.logoImage.image = image
    }
    
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
}












