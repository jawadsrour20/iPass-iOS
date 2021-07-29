//
//  ItemCell.swift
//  iPass
//
//  Created by Apple on 22/07/2021.
//

import UIKit
import Foundation

class ItemCell : NSObject{
    var email : String
    var password : String
    var applicationName: String
    var iconName : String
    var isFavorite : Bool
    var savedAccountOwner: String
    var website: String
    init?(_ email: String, _ password: String, _ applicationName: String,
         _ iconName: String, _ isFavorite: Bool, _ savedAccountOwner: String, _ website: String) {
        
        guard !email.isEmpty && !password.isEmpty && !applicationName.isEmpty && !iconName.isEmpty
                && !savedAccountOwner.isEmpty && !website.isEmpty
        else {
            return nil
        }
        
        self.email = email
        self.password = password
        self.applicationName = applicationName
        self.iconName = iconName
        self.isFavorite = isFavorite
        self.savedAccountOwner = savedAccountOwner
        self.website = website
    }
}
