//
//  LoginViewController.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO on 20/7/16.
//  Copyright © 2016 LogicAppSourceIO. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UITableViewController
{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login to LogicShoppyIO"
        
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func loginDidTap()
    {
        if emailTextField.text != "" && (passwordTextField.text?.characters.count)! > 6 {
            let email = emailTextField.text!
            let password = passwordTextField.text!
            //print("User entered Credentials ")
            Auth.auth().signIn(withEmail: email, password: password, completion: { (firUser, error) in
                if let error = error {
                    self.alert("Could not Authenticate user ", message: error.localizedDescription, buttonTitle: "OK")
                } else {
                    print("User succesfully Authenticated")
                    self.performSegue(withIdentifier: "loginMain", sender: self)
                }
            })
        }
    }
    
    func alert(_ title: String, message: String, buttonTitle: String) {
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














