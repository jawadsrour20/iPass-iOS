//
//  MyCustomButton.swift
//  iPass
//
//  Created by Apple on 20/07/2021.
//

import UIKit

@IBDesignable class MyCustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var cornerRadius: CGFloat = 0 {
            didSet {
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
            }
        }
}
