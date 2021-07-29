//
//  ViewController.swift
//  iPass
//
//  Created by Apple on 19/07/2021.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
    @IBOutlet weak var passwordTextfield: MyCustomTextField!
    
    @IBOutlet weak var emailTextfield: MyCustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginPressed(_ sender: Any) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            if let e = error {
                // gives an error msg that user understands
                let alert = UIAlertController(title: "Login Failed", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self?.present(alert, animated: true, completion: nil)
//                    print(e.localizedDescription)
            }
            else {
                // navigate to home-page
                self?.performSegue(withIdentifier: "loginToHome", sender: self)
            }
        }
        }
    }
    
}

