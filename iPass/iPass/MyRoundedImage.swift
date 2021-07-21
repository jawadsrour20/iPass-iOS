//
//  MyRoundedImage.swift
//  iPass
//
//  Created by Apple on 21/07/2021.
//

import UIKit

class MyRoundedImage: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 2
    }
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 2
    }
    

}
