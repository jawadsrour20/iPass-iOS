//
//  MyCustomTextField.swift
//  iPass
//
//  Created by Apple on 20/07/2021.
//

import UIKit

@IBDesignable class MyCustomTextField: UITextField {

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
    
    
    @IBInspectable var MyImage: UIImage? = nil {
        didSet{
            addRightImg(field: self, img: MyImage!)
        }
    }
    
    @IBInspectable var MyLeftImage: UIImage? = nil {
        didSet{
            addLeftImg(field: self, img: MyLeftImage!)
        }
    }
    
    func addLeftImg(field: UITextField, img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        field.leftView = leftImageView
        field.leftViewMode = .always
    }
    
    func addRightImg(field: UITextField, img: UIImage){
        let rightImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        rightImageView.image = img
        field.rightView = rightImageView
        field.rightViewMode = .always
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        field.rightView?.isUserInteractionEnabled = true
        field.rightView?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        print("Tapped")
    }

}
