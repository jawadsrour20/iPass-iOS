//
//  CreateAccountViewController.swift
//  iPass
//
//  Created by Apple on 20/07/2021.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController, UIAlertViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var emailTextfield: MyCustomTextField!
    @IBOutlet weak var passwordTextfield: MyCustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            // register new user with firebase
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    // gives an error msg that user understands
                    let alert = UIAlertController(title: "Registration Failed", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
//                    print(e.localizedDescription)
                }
                else {
                    // navigate to home-page
                    self.performSegue(withIdentifier: "registerToHome", sender: self)
                }
                
        }
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
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    

}
