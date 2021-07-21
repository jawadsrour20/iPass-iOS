//
//  TestViewController.swift
//  iPass
//
//  Created by Apple on 20/07/2021.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var myfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myimg = UIImage(named:"lock")
        addLeftImg(field: myfield, img: myimg!)
    }
    
    func addLeftImg(field: UITextField, img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        field.rightView = leftImageView
        field.rightViewMode = .always
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
