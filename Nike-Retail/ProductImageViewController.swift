//
//  ShoeImageViewController.swift
//  LogicShoppyIO
//
//  Created by logicappsource on 3/25/17.
//  Copyright © 2017 logicappsource. All rights reserved.
//

import UIKit

class ProductImageViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
    }

}
