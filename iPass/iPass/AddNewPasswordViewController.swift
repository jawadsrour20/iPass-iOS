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
        
        var imgs = [UIImageView]()
        
        for _ in 0..<10{
            let myNewImageView = UIImageView()
            imgs += [myNewImageView]
        }
        for myimage in imgs {
            myimage.image = UIImage(named:"twitter")
            myimage.contentMode = .scaleAspectFit
            myimage.widthAnchor.constraint(equalToConstant: 60).isActive=true
            horizontallyScrollableSV.addArrangedSubview(myimage)
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
