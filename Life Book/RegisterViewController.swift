//
//  RegisterViewController.swift
//  Life Book
//
//  Created by Max Rogers on 8/3/17.
//  Copyright © 2017 App Factory. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        if emailTextField.text != "" && usernameTextField.text != "" && passwordTextField.text != "" {
            //TODO: hit api
            performSegue(withIdentifier: "hooray", sender: nil)
        } else {
            //TODO: alert user to fill fields
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
