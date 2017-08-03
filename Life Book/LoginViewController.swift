//
//  LoginViewController.swift
//  Life Book
//
//  Created by Max Rogers on 8/3/17.
//  Copyright © 2017 App Factory. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: button actions
    @IBAction func registerTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "register", sender: nil)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if usernameTextField.text != "" && passwordTextField.text != "" {
            //TODO: hit api
            performSegue(withIdentifier: "hooray", sender: nil)
        } else {
            //TODO: alert user to fill in fields
        }
    
    }
    
    
    // move to next textfield on done tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    
    
}
