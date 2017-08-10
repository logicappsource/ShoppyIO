//
//  FeedTableViewController.swift
//  LogicShoppyIO 
//
//  Created by LogicAppSourceIO on 15/3/17.
//  Copyright © 2017 LogicAppSourceIO.. All rights reserved.
//

import UIKit
import Firebase

class FeedTableViewController: UITableViewController
{
    var products: [Product]?
    
    struct Storyboard {
        static let feedProductCell = "FeedProductCell"
        static let showProductDetail = "ShowProductDetail"
        static let showWelcome = "ShowWelcome"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser == nil {
            self.performSegue(withIdentifier: Storyboard.showWelcome, sender: nil)
        } else {
            // start doing something with your user here.
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "FEED"
        fetchProducts()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Fetching from Firebase
    
    func fetchProducts()
    {
        Product.fetchProducts { (products) in
            self.products = products
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let products = products {
            return products.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewController.Storyboard.feedProductCell, for: indexPath) as! FeedProductCell

        if let products = products {
            let product = products[indexPath.row]
            cell.product = product
            cell.selectionStyle = .none
        }

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    fileprivate var selectedProduct: Product?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedProduct = products?[indexPath.row]
        performSegue(withIdentifier: Storyboard.showProductDetail, sender: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Storyboard.showProductDetail {
            if let productDetailTVC = segue.destination as? ProductDetailTVC {
                productDetailTVC.product = selectedProduct
            }
        }
    }
}

















