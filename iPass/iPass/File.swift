//
//  File.swift
//  iPass
//
//  Created by Apple on 01/08/2021.
//

import Foundation
import UIKit

class Contact {
    var Name : String = ""
    var Email : String = ""
    var PhoneNumber : String = ""
    var ProfilePicture : UIImageView?
    
    init(_ Name: String, _ Email: String, PhoneNumber: String, _ ProfilePicture: UIImageView){
        self.Name = Name
        self.Email = Email
        self.PhoneNumber = PhoneNumber
        self.ProfilePicture?.image = ProfilePicture.image
        
    }
}
