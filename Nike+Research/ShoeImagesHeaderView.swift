//
//  ShoeImageHeaderView.swift
//  Nike+Research
//
//  Created by LogicAppSourceIO on 01/06/2017.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class ShoeImagesHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    
    
    
    
}




extension ShoeImagesHeaderView: ShoeImagesPageViewControllerDelegate {
    
    func setupPageController(numberOfPages: Int){
            pageControl.numberOfPages = numberOfPages
    }
    
    
    func turnPageController(to index: Int){
        pageControl.currentPage = index 
    }
    
}
