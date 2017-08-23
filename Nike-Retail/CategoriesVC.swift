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
//    @IBOutlet weak var currentUserProfileImageButton: UIButton!
//    @IBOutlet weak var currentUserFullNameButton: UIButton!
    

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

    public struct Storyboard { //Multiple setup cell heres
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
    
    // Implementation Guide
    // Make UIcolelctionViewCell to 3 Categories: Product // CategoryId -> 3 Cells with different ID - Category: product ->
    // compare ids - > cell id  -- if (numberCellClicked > 1 - Display that category)
    // Direct to Feed on cell click
    
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
        //Calc UI
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left  , y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        
    }
    
}


