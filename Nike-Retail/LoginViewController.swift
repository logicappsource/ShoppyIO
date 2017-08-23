//
//  LoginViewController.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO on 20/7/16.
//  Copyright © 2016 LogicAppSourceIO. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UITableViewController, GIDSignInUIDelegate
{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBAction func googleAuthPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login to LogicShoppyIO"
        
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        
        #if DEBUG
            emailTextField.text = "klomanden@gmail.com"
            passwordTextField.text = "klomanden"
        #endif
    }
    
    
    //Google Auth
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            print("Successfully Authenticated")
            self.performSegue(withIdentifier: "loginMain", sender: self)

            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        // ...
        //self.performSegue(withIdentifier: "loginMain", sender: self)

    }
    

    @IBAction func loginDidTap()
    {
            signAuthCreds()
    }
    
    
  
    @IBAction func backDidTap(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }

}

extension LoginViewController {
    
    func signAuthCreds() {
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

extension LoginViewController {
    
    func alert(_ title: String, message: String, buttonTitle: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}














