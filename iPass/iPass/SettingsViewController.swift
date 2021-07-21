//
//  SettingsViewController.swift
//  iPass
//
//  Created by Apple on 20/07/2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.layer.cornerRadius = (profilePic.frame.height / 2)
        profilePic.layer.masksToBounds = true

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
