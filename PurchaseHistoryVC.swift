//
//  PurchaseHistoryVC.swift
//  
//
//  Created by LogicAppSourceIO on 10/08/2017.
//

import UIKit

class PurchaseHistoryVC: UIViewController {
    
    let date = NSDate()
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(date)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
