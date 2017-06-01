//
//  ShoeImagesPageViewController.swift
//  Nike+Research
//
//  Created by LogicAppSourceIO on 01/06/2017.
//  Copyright © 2017 Developers Academy. All rights reserved.
//ShoeImageViewController

import UIKit

class ShoeImagesPageViewController: UIPageViewController {
    
    
    var images: [UIImage]?
    
    struct Storyboard {
        static let shoeImageViewController = "ShoeImageViewController"
    }

    
    lazy var controllers: [UIViewController] =  {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.images {
            for image in images {
                let shoeImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.shoeImageViewController)
                controllers.append(shoeImageVC)
            }
        }
        
        return controllers
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
