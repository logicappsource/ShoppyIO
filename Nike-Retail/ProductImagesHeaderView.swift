//
//  ShoeImagesHeaderViewController.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO. on 3/25/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.
//

import UIKit

class ProductImagesHeaderView: UIView
{
    @IBOutlet weak var pageControl: UIPageControl!
}

extension ProductImagesHeaderView : ProductImagesPageViewControllerDelegate
{
    func setupPageController(_ numberOfPages: Int)
    {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int)
    {
        pageControl.currentPage = index
    }
}











