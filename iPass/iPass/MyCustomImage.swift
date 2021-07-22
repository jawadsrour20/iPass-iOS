//
//  MyCustomImage.swift
//  iPass
//
//  Created by Apple on 22/07/2021.
//

import UIKit

@IBDesignable class MyCustomImage:UIImageView {
    @IBInspectable var borderColor:UIColor = UIColor.white {
        willSet {
            layer.borderColor = newValue.cgColor
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = borderColor.cgColor
    }
}
