//
//  SettingsViewController.swift
//  iPass
//
//  Created by Apple on 20/07/2021.
//

import UIKit
import Firebase
class SettingsViewController: UIViewController {

    @IBOutlet weak var email: UILabel!
    
    
    @IBOutlet public weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        
        email.text = Auth.auth().currentUser?.email
        
    }
    
    
    @IBAction func onSwitchStatusChange(_ sender: Any) {
        if darkModeSwitch.isOn {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
        }
        else{
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
        }
    }
    
    
    
    // when Save is pressed
    @IBAction func unwindChangePasswordSegue(sender: UIStoryboardSegue) {
        
        if sender.source is ChangePasswordViewController
        {
            self.showToast(message: "Password Changed!", font: .systemFont(ofSize: 12.0))
        }
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
