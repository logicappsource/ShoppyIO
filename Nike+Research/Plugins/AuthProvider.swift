//
//  AuthProvider.swift
//  ShoppingIO
//
//  Created by LogicAppSourceIO on 03/08/2017.
//  Copyright © 2017 LogicappsourceIO. All rights reserved.
//

import Foundation
import FirebaseAuth


typealias LoginHandler = (_ msg: String?) -> Void


struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid Email Adress, Please Provide a Real Email Adress"
    static let WRONG_PASSWORD = "WRONG PASSWORd, Please enter the correct password"
    static let PROBLEM_CONNECTING = "Problem Connecting to Database "
    static let USER_NOT_FOUND = "User Not Found, Please Register "
    static let EMAIL_ALLREADY_IN_USE = "Email Allready in use , Please choose another"
    static let WEAK_PASSWORD = "Password should be at least 6 chars long"
}


class AuthProvider {
    
    private static let _instance = AuthProvider()
    
    
    //Create the Instance with class name -> Object
    static var Instance: AuthProvider {
        return _instance
    }
    
    
    func login(withEmail:String, password: String, loginHandler: LoginHandler?) {
        Auth.auth().signIn(withEmail: withEmail, password: password) { (user, error) in
            
            if error != nil {
                //handle errors
            } else {
                loginHandler?(nil)
            }
        }
    }
    
    
    func signUp(withEmail: String, password: String, loginHandler: LoginHandler?) {
        Auth.auth().createUser(withEmail: withEmail, password: password) { (user, error) in
            
            if error != nil {
                //Handling Errors
                print("Error in signing up")
            } else {
                if user?.uid != nil {
                    //store the user to db FIR
                    DbProvider.Instance.saveUser(withID: user!.uid, email: withEmail, password: password)
                    
                    //login user
                    self.login(withEmail: withEmail, password: password, loginHandler: loginHandler)
                }
            }
        }
    }
    
    
    func logOut() -> Bool {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                return true
            } catch {
                return false
            }
        }
        return true
    }
    
    
    
    
}
