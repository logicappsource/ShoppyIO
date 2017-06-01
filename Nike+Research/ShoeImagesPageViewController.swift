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
        
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
       // delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    
}

//MARK: - UIPAGEVIEWCONTROLLERDATASOURCE
extension ShoeImagesPageViewController : UIPageViewControllerDataSource{
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        
        return controllers.last
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        return controllers.first
    }
    
    
    
    
    
    
    
    
}


