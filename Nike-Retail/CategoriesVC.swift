//
//  CategoriesVC.swift
//  Nike-Retail
//
//  Created by LogicAppSourceIO on 22/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {

    // MARK : - IBOutlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var currentUserProfileImageButton: UIButton!
    @IBOutlet weak var currentUserFullNameButton: UIButton!
    

    //MARK: - UICOllectionviewdatasource
    public var categories = Category.createCategory()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .default
//    }
    
    public struct Storyboard {
        static let CellIdentifier = "CategoryCell2"
    }

}

extension CategoriesVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.category = self.categories[indexPath.item]
        
        return cell
    }
}

extension CategoriesVC: UIScrollViewDelegate { //UI Scroll lets element be in full and not half of screen -> (better Scroll Experince)
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left)  / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        //Calc UI -
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left  , y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        
    }
    
}


