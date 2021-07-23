//
//  AddNewPasswordViewController.swift
//  iPass
//
//  Created by Apple on 21/07/2021.
//

import UIKit

class AddNewPasswordViewController: UIViewController {

    @IBOutlet weak var horizontallyScrollableSV: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var buttons = [UIButton]()
        
        for _ in 0..<10{
            let myNewImageView = UIButton()
            buttons += [myNewImageView]
        }
        for mybutton in buttons {
            let myimg = UIImage(named:"twitter")
            mybutton.widthAnchor.constraint(equalToConstant: 60).isActive=true
            mybutton.setBackgroundImage(myimg, for: .normal)
            horizontallyScrollableSV.addArrangedSubview(mybutton)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
