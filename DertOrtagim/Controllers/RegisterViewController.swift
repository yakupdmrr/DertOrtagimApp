//
//  RegisterViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 17.10.2021.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utility.instance.buttonProperties(button: registerButton)
        Utility.instance.textFieldLine(textField: emailTextField)
        Utility.instance.textFieldLine(textField: passwordTextField)
        Utility.instance.textFieldLine(textField: firstNameTextField)
        Utility.instance.textFieldLine(textField: lastNameTextField)
        
        passwordTextField.isSecureTextEntry = true
     
    }

    @IBAction func register(_ sender: Any) {
        performSegue(withIdentifier: "toLoginPage", sender: nil)
    }
}