//
//  DbProvider.swift
//  ShoppingIO
//
//  Created by LogicAppSourceIO on 03/08/2017.
//  Copyright © 2017 LogicappsourceIO. All rights reserved.
//

import Foundation
import FirebaseDatabase


class DbProvider {
    
    private static let _instance = DbProvider()
    
    static var Instance: DbProvider {
        return _instance
    }
    
    var dbRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var userMailReference: DatabaseReference {
        return dbRef.child(Constants.EMAIL)
    }
    
    
    func saveUser(withID: String, email: String, password: String) {
        let data: Dictionary<String,Any> = [Constants.EMAIL: email, Constants.PASSWORD: password];
        
        //Store the data
         userMailReference.child(withID).child(Constants.DATA).setValue(data)
    }
    
}
