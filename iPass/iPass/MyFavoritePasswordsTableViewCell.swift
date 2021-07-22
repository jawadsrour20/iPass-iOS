//
//  MyFavoritePasswordsTableViewCell.swift
//  iPass
//
//  Created by Apple on 23/07/2021.
//

import UIKit

class MyFavoritePasswordsTableViewCell: UITableViewCell {

    @IBOutlet weak var FavoriteMail: UILabel!
    @IBOutlet weak var FavoriteAppName: UILabel!
    @IBOutlet weak var FavoriteImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
