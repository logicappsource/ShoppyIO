//
//  ShoeImagesPageViewController.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 6/8/17.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

protocol ProductImagesPageViewControllerDelegate: class
{
    func setupPageController(_ numberOfPages: Int)
    func turnPageController(to index: Int)
}

class ProductImagesPageViewController: UIPageViewController
{
    
    var product: Product!
    
    weak var pageViewControllerDelegate: ProductImagesPageViewControllerDelegate?
    
    struct Storyboard {
        static let productImageViewController = "ProductImageViewController"
    }
    
    lazy var controllers: [UIViewController] = {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        if let imageLinks = self.product.imageLinks {
            for imageLink in imageLinks {
                let productImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.productImageViewController)
                controllers.append(productImageVC)
            }
        }
        
        self.pageViewControllerDelegate?.setupPageController(controllers.count)
        
        return controllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        self.turnToPage(0)
    }
    
    func turnToPage(_ index: Int)
    {
        let controller = controllers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first {
            let currentIndex = controllers.index(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        
        self.configureDisplaying(controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(_ viewController: UIViewController)
    {
        for (index, vc) in controllers.enumerated() {
            if viewController === vc {
                if let productImageVC = viewController as? ProductImageViewController {
                    productImageVC.imageLink = self.product.imageLinks?[index]
                    
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }
}

// MARK: - UIPageViewControllerDataSource

extension ProductImagesPageViewController : UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        if let index = controllers.index(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
}

extension ProductImagesPageViewController : UIPageViewControllerDelegate
{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController])
    {
        self.configureDisplaying(pendingViewControllers.first as! ProductImageViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if !completed {
            self.configureDisplaying(previousViewControllers.first as! ProductImageViewController)
        }
    }
}










