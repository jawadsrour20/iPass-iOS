//
//  ContactUsTableViewCell.swift
//  iPass
//
//  Created by Apple on 01/08/2021.
//

import UIKit

class ContactUsTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var PhoneNumber: UILabel!
    @IBOutlet weak var ProfilePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
