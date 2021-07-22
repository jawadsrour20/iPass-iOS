//
//  ItemCell.swift
//  iPass
//
//  Created by Apple on 22/07/2021.
//

import UIKit
import Foundation

class ItemCell{
    var Mail : String = ""
    var AppName : String = ""
    var ImageView : UIImage?
    init(_ Mail: String, _ AppName: String, _ Image: UIImage?) {
        self.Mail = Mail
        self.AppName = AppName
        self.ImageView = Image
    }
}
