//
//  SignupTableViewController.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 21/7/16.
//  Copyright © 2016 LogicAppSourceIO.. All rights reserved.
//

import UIKit
import Firebase

class SignupTableViewController: UITableViewController
{
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var imagePickerHelper: ImagePickerHelper!
    var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create New Account"
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
        profileImageView.layer.masksToBounds = true
        
        emailTextField.delegate = self
        fullNameTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func createNewAccountDidTap() {
        // create a new account
        // save the user data, take a photo
        // login the user
        if emailTextField.text != ""
            && (passwordTextField.text?.characters.count)!  > 6
            && (usernameTextField.text?.characters.count)! > 6
            && fullNameTextField.text != ""
            && profileImage != nil {
            
            let username = usernameTextField.text!
            let email = emailTextField.text!
            let password = passwordTextField.text!
            
            Auth.auth().createUser(withEmail: email, password: password, completion: { (firUser, error) in
                if error != nil {
                    // report error
                    print("User not succesful signed up ")
                } else if let firUser = firUser {
                    let newUser = User(uid: firUser.uid, username: username, profileImage: self.profileImage)
                    newUser.save({ (error) in
                        if error != nil {
                            // report
                        } else {
                            // Login User
                            Auth.auth().signIn(withEmail: email, password: password, completion: { (firUser, error) in
                                if let error = error {
                                    // report error
                                    print(error)
                                } else {
                                    self.alertUser("Success - Please login to Continue", message: "Succes", buttonTitle: "OK")
                                    self.performSegue(withIdentifier: "directLogin", sender: self)
                                }
                            })
                        }
                    })
                }
            })
        }
    }
    
    func alertUser(_ title: String, message: String, buttonTitle: String) {
        let alertVC = UIAlertController(title: title, message: message,  preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func backDidTap(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeProfilePhotoDidTap(_ sender: Any)
    {
        imagePickerHelper = ImagePickerHelper(viewController: self, completion: { (image) in
            self.profileImageView.image = image
            self.profileImage = image
        })
    }
}

extension SignupTableViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            fullNameTextField.becomeFirstResponder()
        } else if textField == fullNameTextField {
            usernameTextField.becomeFirstResponder()
        } else if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            createNewAccountDidTap()
        }
        
        return true
    }
}












