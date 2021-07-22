//
//  MyPasswordsTableViewCell.swift
//  iPass
//
//  Created by Apple on 22/07/2021.
//

import UIKit

class MyPasswordsTableViewCell: UITableViewCell {

    @IBOutlet weak var EmailInCell: UILabel!
    @IBOutlet weak var AppNameInCell: UILabel!
    @IBOutlet weak var MyImageInCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
