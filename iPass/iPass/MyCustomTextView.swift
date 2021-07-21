//
//  MyCustomTextView.swift
//  iPass
//
//  Created by Apple on 20/07/2021.
//

import UIKit

@IBDesignable class MyCustomTextView: UITextField {

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
    
    @IBInspectable var MyImage: UIImage = UIImage(named:"lock")! {
        didSet{
            addLeftImg(field: self, img: MyImage)
        }
    }
    
    
    func addLeftImg(field: UITextField, img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        field.rightView = leftImageView
        field.rightViewMode = .always
    }
}
