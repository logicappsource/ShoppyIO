//
//  ProductDetailTVC.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO on 2/12/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
}

class ProductDetailTVC: UITableViewController
{
    @IBOutlet weak var productImagesHeaderView: ProductImagesHeaderView!
    
    static let identifier = "ProductDetailVC"
    
    let relatedProducts = Product.fetchProducts()
    var product: Product!
    
    struct Storyboard {
        static let productDetailCell = "ProductDetailCell"
        static let buyButtonCell = "BuyButtonCell"
        static let showProductDetailCell = "ShowProductDetailCell"
        static let showImagesPageVC = "ShowImagesPageViewController"
        static let suggestionCell = "SuggestionTableViewCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = product.name
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - UITableViewDataSource
    
    
    
    // indexPath.row
    // 0 - productDetailCell
    // 1 - buyButtonCell
    // 2 - showProductDetail
    // 3 - you might also like this cell

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath) as! ProductDetailCell
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath) as! BuyButtonCell
            cell.product = product
            cell.selectionStyle = .none
            cell.delegate = self
            
            return cell
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.showProductDetailCell, for: indexPath)
             cell.selectionStyle = .none
            
            return cell
            
        } else {
            // product suggestions
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.suggestionCell, for: indexPath) as! SuggestionTableViewCell
            
            // TODO: - set product suggestions data here.
            
//            let products = Product.fetchProducts()
//            cell.collectionView = products[indexPath.row].images?.first
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 3 {
            return tableView.bounds.width + 68
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if indexPath.row == 3 {
            if let cell = cell as? SuggestionTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case Storyboard.showImagesPageVC:
            if let imagesPageVC = segue.destination as? ProductImagesPageViewController {
                imagesPageVC.product = product
                imagesPageVC.pageViewControllerDelegate = productImagesHeaderView
            }
            
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ProductDetailTVC : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return relatedProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCollectionViewCell", for: indexPath) as! SuggestionCollectionViewCell
        // TODO: - set real data for product suggestions
        
        //cell.image = products[indexPath.item].images?.first
        cell.product = relatedProducts[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ProductDetailTVC : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Pressed item")
        
        let product = relatedProducts[indexPath.row]
        let vc = UIStoryboard.main.instantiateViewController(withIdentifier: ProductDetailTVC.identifier) as! ProductDetailTVC
        vc.product = product
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductDetailTVC : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 5.0
            layout.minimumLineSpacing = 2.5
            let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
        return CGSize.zero
    }
}

// MARK: - BuyButtonCellDelegate

extension ProductDetailTVC : BuyButtonCellDelegate
{
    func addToCart(_ product: Product) {
        ShoppingCart.add(product)
    }
}







