//
//  ChangePasswordViewController.swift
//  iPass
//
//  Created by Jawad Srour on 7/31/21.
//

import UIKit
import Firebase




class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var oldPasswordTextfield: UITextField!
    @IBOutlet weak var newPasswordTextfield: UITextField!
    let user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if let email = emailTextfield.text, let oldPassword = oldPasswordTextfield.text{
            let credential = EmailAuthProvider.credential(withEmail: email, password: oldPassword)
            
  
            
            user?.reauthenticate(with: credential) { AuthDataResult, error  in
                    if error != nil {
                        let alert = UIAlertController(title: "Failed to Re-Authenticate", message: "Make sure you provided correct credentials.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                        }))
                        self.present(alert, animated: true, completion: nil)
                  } else {
                    // User re-authenticated.
                    if let newPassword = self.newPasswordTextfield.text{
                    Auth.auth().currentUser?.updatePassword(to: newPassword) { (error) in
                        
                        if (error != nil){
                        let alert = UIAlertController(title: "Failed to Change Password!", message: "Please Try Again Later.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                        }))
                        }
                        else
                        {
                            
                          
                            
                            self.navigationController?.popViewController(animated: true)
                            
    
                        }
                    }
                    }
                  }
                }
        
        
    }
    }

}
