//
//  CheckoutTableViewController.swift
//  LogicShoppyIO 
//
//  Created by LogicAppSource on 3/19/17.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit
import Stripe
import AFNetworking

class CheckoutTableViewController: UITableViewController
{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    @IBOutlet weak var securityTextField: UITextField!
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var shippingCostLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var submitOrderButton: UIButton!
    
    var shoppingCart: ShoppingCart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "CHECKOUT"
        updateUI()
    }
    
    func updateUI()
    {
        if shoppingCart != nil {
            if let subtotal = shoppingCart.subtotal, let shipping = shoppingCart.shipping, let tax = shoppingCart.tax, let total = shoppingCart.total {
                subtotalLabel.text = "$\(subtotal)"
                
                if shipping == 0 {
                    shippingCostLabel.text = "FREE"
                } else {
                    shippingCostLabel.text = "$\(shipping)"
                }
                
                taxLabel.text = "$\(tax)"
                totalLabel.text = "$\(total)"
            }
        }
    }
    
    // MARK: - Target / Action
    
    @IBAction func submitOrderButtonDidTap()
    {
        // 1 - initiate a stripe card
        var stripeCard = STPCard()
        
        // 1.2 - get the credit card information from the text fields
        if expirationDateTextField.text?.isEmpty == false {
            let expirationDate = expirationDateTextField.text?.components(separatedBy: "/")
            let expMonth = UInt((expirationDate?[0])!)!
            let expYear = UInt((expirationDate?[1])!)!
            
            // 2 - send the card information to stripe to get a token
            stripeCard.number = cardNumberTextField.text
            stripeCard.cvc = securityTextField.text
            stripeCard.expMonth = expMonth
            stripeCard.expYear = expYear
            
            // 3 - validate the card numbers
            STPAPIClient.shared().createToken(withCard: stripeCard, completion: { (token, error) in
                // we have an error or not
                if error != nil {
                    // handle the error
                    self.handleError(error: error!)
                    return
                } else {
                    // we get a token
                    // post the token to Stripe using our web server!!!
                    self.postToStripe(token: token!)
                }
                
            })
        }
    }
    
    func postToStripe(token: STPToken)
    {
        //URL -> Server
        let url = "http://localhost:3422/stripe-payment/payment.php"  //3422
        let params: [String : Any] = [
            "stripeToken" : token.tokenId,
            "amount" : shoppingCart.total!,
            "currency" : "usd",
            "description" : self.emailTextField!.text!
        ]
        
        let manager = AFHTTPSessionManager().post(url, parameters: params, success: { (operation, responseObject) in
            
            if let response = responseObject as? [String : String] {
                print(response["status"]! +  "------" + response["message"]!)
                
                let alertController = UIAlertController(title: "Payment - Authorized", message: "Your payment is successfully processed!!!", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default) { (alertAction) in
                    self.dismiss(animated: true, completion: nil)
                }
                
                alertController.addAction(okButton)
                self.present(alertController, animated: true, completion: nil)
            }
            
        }) { (operation, error) in
                self.handleError(error: error)
        }
    }
    
    func handleError(error: Error)
    {
        let alertController = UIAlertController(title: "Payment - UnAuthorized - Pleae try again", message: error.localizedDescription, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { (alertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
}





















