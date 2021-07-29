//
//  PasswordDetailsViewController.swift
//  iPass
//
//  Created by Jawad Srour on 7/29/21.
//

import UIKit
import OSLog
class PasswordDetailsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var applicationName: UILabel!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    var selectedItem : ItemCell?
    var newPassword : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextfield.delegate = self
        
        if let item = selectedItem {
            self.iconImage.image = UIImage(named: "\(item.iconName)")
            self.email.text = item.email
            self.website.text = item.website
            self.applicationName.text = item.applicationName
            self.passwordTextfield.text = item.password
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    // sending updated data (password) to MyPasswordsPAgeTableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // not necessary to call super.prepare()
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        
        // button == saveButton always returns false
        // because it checks for reference (memory addresses)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        
        newPassword = passwordTextfield.text
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        
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
