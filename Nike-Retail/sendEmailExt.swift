//
//  sendEmailExt.swift
//  LogicShoppyIO
//
//  Created by LogicAppSourceIO on 10/08/2017.
//  Copyright © 2017 LogicAppSource. All rights reserved.
//

import Foundation
import MessageUI


var userEmail = [String]()
var userReciepeContent: String?



func sendEmail() {
    if MFMailComposeViewController.canSendMail() {
        let mail = MFMailComposeViewController()
        mail.setToRecipients(userEmail)
        mail.setMessageBody(userReciepeContent!, isHTML: true)
        
//        present(mail, animated: true)
//        https://www.hackingwithswift.com/example-code/uikit/how-to-send-an-email
    } else {
        //Show failre alert
    }
}


func mailComposerController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true)
}
