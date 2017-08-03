//
//  AuthViewController.swift
//  ShoppingIO
//
//  Created by LogicAppSourceIO on 20/06/2017.
//  Copyright © 2017 LogicappsourceIO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginAuthVC: UIViewController {
    
    private  let mainVC = "main"
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    static let showWelcome = "ShowWelcome"
    
    @IBAction func loginUserInButton(_ sender: Any) {
        loginUser()
    }
    
    
    
    func loginUser() {
        if emailTxtField.text != "" && passwordTxtField.text != "" {
            AuthProvider.Instance.login(withEmail: emailTxtField.text!, password: passwordTxtField.text!, loginHandler: { (message) in
                if message != nil {
                    self.alertuser(title: "Failed to Authenticate User", message: message!)
                } else {
                    //Auhtenticated
                  //  AuthProvider.Instance = self.emailTxtField.text!
                    self.emailTxtField.text = ""
                    self.passwordTxtField.text = ""
                    print("User Succesfully Authenticated")
                    
                    self.performSegue(withIdentifier: self.mainVC, sender: self)
                }
            })
        } else {
            alertuser(title: "Email & Password is requiered ", message: "Please Enter Email and Password in the textfield")
        }
    }
    
    
        
        func alertuser(title: String,message: String ) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true , completion: nil)
        }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
        
    
}
