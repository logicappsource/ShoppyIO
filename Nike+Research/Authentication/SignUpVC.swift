//
//  SignUpVC.swift
//  ShoppingIO
//
//  Created by LogicAppSourceIO on 02/08/2017.
//  Copyright © 2017 LogicappsourceIO. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    private let MAIN_VC = "main"
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    
    
    @IBAction func signUpUserBtn(_ sender: Any) {
        signUpUserToFIR()
    }
    
    
    
    
    func signUpUserToFIR() {
        if usernameTxtField.text != "" && emailTxtField.text != "" && firstNameTxtField.text != "" && lastNameTxtField.text != "" && passwordTxtField.text != "" {
            AuthProvider.Instance.signUp(withEmail: emailTxtField.text!, password: passwordTxtField.text!, loginHandler: { (message) in
                
                if message != nil {
                    self.alertTheUser(title: "Problem with creating new user", message: message!)
                } else {
                    print("User signup completed")
                    self.emailTxtField.text = ""
                    self.passwordTxtField.text = ""
                    self.performSegue(withIdentifier: self.MAIN_VC, sender: self)
                }
            })
        }
    }
    
    func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
