//
//  FirebaseReference.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO on 4/17/17.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Firebase

enum DTDatabaseReference
{
    case root
    case users(uid: String)
    case products(uid: String)
    
    // MARK: - Public
    
    func reference() -> DatabaseReference {
        switch self {
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }
    
    fileprivate var rootRef: DatabaseReference {
        return Database.database().reference()
    }
    
    fileprivate var path: String {
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
    case profileImages  //  user's profile image
    case images // general images in app
    
    func reference() -> FirebaseStorage.StorageReference {
        return baseRef.child(path)
    }
    
    fileprivate var baseRef: FirebaseStorage.StorageReference {
        return Storage.storage().reference()
    }
    
    fileprivate var path: String {
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
