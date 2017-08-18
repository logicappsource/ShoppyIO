


//class SuggestionCollectionViewCell: UICollectionViewCell
//{
//    @IBOutlet weak var imageView: UIImageView!
//
//    var image: UIImage! {
//        didSet {
//            self.imageView.image = image
//            setNeedsLayout()
//        }
//    }
//}

//
//  SuggestionCollectionViewCell.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 5/4/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.


import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var imageView: UIImageView!


    var product: Product? {
        didSet {
            updateUI()
        }
    }


    func updateUI() {
        
        guard let product = product else {
            return
        }
        
        // Set image directly
        self.imageView.image = product.images?.first
        
        // (Optionally) Download the image
        //       imageView.image = nil
        //       if let imageLinks = product.imageLinks, let imageLink = imageLinks.first {
        //                FIRImage.downloadImage(uri: imageLink, completion: { (image, error) in
        //                    if error == nil {
        //                        self.imageView.image = image
        //                    }
        //                })
        //            }
    }


}



























