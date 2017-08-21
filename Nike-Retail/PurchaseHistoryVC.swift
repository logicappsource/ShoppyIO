//
//  PurchaseHistoryVC.swift
//  
//
//  Created by LogicAppSourceIO on 10/08/2017.
//
import UIKit

class PurchaseHistoryVC: UIViewController, UserPurchaseInfoDelegate {
    
        var today : String!


    func userReceivePurchaseInfo(shoppingInfo: ShoppingCart) {
        let priceTotal  = shoppingInfo.total
        let priceTax = shoppingInfo.tax
        let shippingCosts = shoppingInfo.shipping
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get the new VC using segue.destinationViewController
        //Pass the selected object to the new View Controller
        
        if segue.identifier == "sendUserInfoSegue" {
            let vc: CheckoutTableViewController = segue.destination as! CheckoutTableViewController
            vc.delegate = self
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
            today = getTodayString()
            //userReceivePurchaseInfo(shoppingInfo)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
          today = getTodayString()
        
          print(today)
        // Do any additional setup after loading the view.
    }


}

extension PurchaseHistoryVC {
    
    func getTodayString() -> String{ // get timestamp
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }
    
    
    
}

//If purhcase in shopping cart call private method Protocol - delegate

/*
 ------------------  Purchase History
 (1) Segue after alert
 (2) Access properties of specific user and sales  - show image - in table view ---
 (3) Display to user
 (4) Send reciepe as an email to the user
 (5) With timestamp
 (6) Show price
 
 
 if let  (products?[indexPath.item]) { .count }
 Populate  products[] to table view cell
 */
