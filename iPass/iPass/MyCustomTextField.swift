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
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        setLeftPadding(10)
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setLeftPadding(10)
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
            didSet {
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
            }
        }
    
    
    @IBInspectable var RightIcon: UIImage? = nil {
        didSet{
            setRightIcon(img: RightIcon!)
        }
    }
    
    @IBInspectable var LeftIcon: UIImage? = nil {
        didSet{
            setLeftIcon(img: LeftIcon!)
        }
    }
    
    func setLeftPadding(_ amount:CGFloat){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
    }
    
    func setLeftIcon(img: UIImage) {

        let padding = 10
        let size = 20

        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: img.size.width+CGFloat(padding), height: img.size.height) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = img
        outerView.addSubview(iconView)

        self.leftView = outerView
        self.leftViewMode = .always
      }
    
    func setRightIcon(img: UIImage) {

        let padding = 10
        let size = 20

        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: img.size.width+CGFloat(padding), height: img.size.height) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = img
        outerView.addSubview(iconView)

        self.rightView = outerView
        self.rightViewMode = .always
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.rightView?.isUserInteractionEnabled = true
        self.rightView?.addGestureRecognizer(tapGestureRecognizer)
      }
    
    /*
    func addRightImg(field: UITextField, img: UIImage){
        let rightImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        rightImageView.image = img
        field.rightView = rightImageView
        field.rightViewMode = .always
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        field.rightView?.isUserInteractionEnabled = true
        field.rightView?.addGestureRecognizer(tapGestureRecognizer)
    }
    */
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        print("Tapped")
        let largeConfig = UIImage.SymbolConfiguration(scale: .large)
        if (self.isSecureTextEntry == true){
            RightIcon = UIImage(systemName: "eye", withConfiguration:largeConfig)!.withRenderingMode(.alwaysOriginal)
            self.isSecureTextEntry = false
        }
        else{
            self.isSecureTextEntry = true
            RightIcon = UIImage(systemName: "eye.slash", withConfiguration:largeConfig)!.withRenderingMode(.alwaysOriginal)
        }
    }

}
