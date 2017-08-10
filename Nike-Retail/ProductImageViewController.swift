//
//  ShoeImageViewController.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 7/5/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.
//

import UIKit

class ProductImageViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    
    var imageLink: String? {
        didSet {
            if let imageLink = imageLink {
                FIRImage.downloadImage(uri: imageLink, completion: { (image, error) in
                    if error == nil && image != nil {
                        self.imageView?.image = image
                    }
                })
            }
        }
    }
}











