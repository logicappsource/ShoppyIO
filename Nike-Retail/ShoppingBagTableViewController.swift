//
//  ShoppingBagTableViewController.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO on 7/4/17.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

class ShoppingBagTableViewController: UITableViewController
{
    var products: [Product]?
    
    // 16-Challenge-1: We have an instance of shopping cart here so we can fetch new products and pass it to the check out page
    // 16-Challenge-2: create the ShoppingCart.fetch(_) method in ShoppingCart
    var shoppingCart = ShoppingCart()
    
    struct Storyboard {
        static let numberOfItemsCell = "numberOfItemsCell"
        static let itemCell = "itemCell"
        static let cartDetailCell = "cartDetailCell"
        static let totalCell = "totalCell"
        static let checkoutButtonCell = "checkoutButtonCell"
        static let showCheckout = "ShowCheckout"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 70.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // 16-Challenge-4: Fetch Products in viewWillAppear and fetchProducts()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchProducts()
    }
    
    func fetchProducts()
    {
        self.products?.removeAll()
        shoppingCart.fetch { [weak self] () in
            self?.products = self?.shoppingCart.products
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showCheckout {
            let checkoutTVC = segue.destination as! CheckoutTableViewController
            checkoutTVC.shoppingCart = shoppingCart
        }
    }
}

// MARK: - UITableViewDataSource

extension ShoppingBagTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let products = products {
            return products.count + 4
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let products = products else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.numberOfItemsLabel.text = "0 ITEM"
            return cell
        }
        
        if indexPath.row == 0 {
            // number of items cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.numberOfItemsLabel.text = (products.count == 1) ? "\(products.count) ITEM" : "\(products.count) ITEMS"
            return cell
            
        } else if indexPath.row == products.count + 1 {
            // cart detail cell -- 
            // 16-Challenge-8: assign the sub total cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartDetailCell, for: indexPath) as! CartSubtotalCell
            
            cell.shoppingCart = shoppingCart
            
            return cell
            
        } else if indexPath.row == products.count + 2 {
            // cart total cell
            // 16-Challenge-9: assign the total cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.totalCell, for: indexPath) as! CartTotalCell
            
            cell.shoppingCart = shoppingCart
            
            return cell
            
        } else if indexPath.row == products.count + 3 {
            // checkout button cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.checkoutButtonCell, for: indexPath)
            
            return cell
            
            
        } else {
            // item cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.itemCell, for: indexPath) as! ShoppingCartItemCell
            cell.product = products[indexPath.row - 1]
            return cell
        }
    }
    
    
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
            //Handle delete ( removing the data from your array and updating the tableview)
            //Remove the product from the cell
            if let product = products?[indexPath.item] {
                ShoppingCart.remove( product)
                products?.remove(at: indexPath.item)
            }
            self.tableView.reloadData()
            
        }
    }
    
    
    
}




















