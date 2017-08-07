//
//  LoginViewController.swift
//  LogicShoppyIO 
//
//  Created by logicappsource on 11/5/16.
//  Copyright © 2017 logicappsource. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UITableViewController
{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var  mainVC = "main"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login to Moments"
        
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func loginDidTap()
    {
        if emailTextField.text != "" && (passwordTextField.text?.characters.count)! > 6 {
            let email = emailTextField.text!
            let password = passwordTextField.text!
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (firUser, error) in
                if let error = error {
                    self.alert(title: "Oops!", message: error.localizedDescription, buttonTitle: "OK")
                } else {
                    self.performSegue(withIdentifier: "main", sender: self)
                    print("User successfully Authenticated ")
                }
            })
        }
    }
    
    func alert(title: String, message: String, buttonTitle: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
  
    @IBAction func backDidTap(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }

}

extension LoginViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            loginDidTap()
        }
        
        return true
    }
}













