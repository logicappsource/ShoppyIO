//
//  FirebaseReference.swift
//  LogicShoppyIO
//
//  Created by logicappsourceon 4/17/17.
//  Copyright © 2017 logicappsource. All rights reserved.
//

import Foundation
import Firebase

enum DatabaseReference
{
    case root
    case users(uid: String)
    case products(uid: String)
    
    // MARK: - Public
    
    func reference() -> FIRDatabaseReference {
        switch self {
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }
    
    private var rootRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .users(let uid):
            return "users/\(uid)"
        case .products(let uid):
            return "products/\(uid)"
        }
    }
}

enum StorageReference
{
    case root
    case profileImages  // for user's profile image
    case images // general images in app
    
    func reference() -> FIRStorageReference {
        return baseRef.child(path)
    }
    
    private var baseRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .profileImages:
            return "profileImages"
        case .images:
            return "images"
        }
    }
}
