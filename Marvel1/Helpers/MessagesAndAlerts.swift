//
//  MessagesAndAlerts.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
import UIKit

class MessagesAndAlerts {
    
    static func showAlert(title:String , message:String , btnText:String ){
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButton(withTitle: btnText)
        alert.show()
    }
    
}
