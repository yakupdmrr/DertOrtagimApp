//
//  RegisterViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 17.10.2021.
//

import UIKit

final class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldProperties()
    }
    
    private func textFieldProperties(){
        registerButton.buttonProperties()
        firstNameTextField.textFieldLine()
        lastNameTextField.textFieldLine()
        emailTextField.textFieldLine()
        passwordTextField.textFieldLine()
        userNameTextField.textFieldLine()
        
        emailTextField.textFieldPlaceholderColor(placeholder: " EMAİL")
        passwordTextField.textFieldPlaceholderColor(placeholder: " PASSWORD")
        firstNameTextField.textFieldPlaceholderColor(placeholder: " AD")
        lastNameTextField.textFieldPlaceholderColor(placeholder: " SOYAD")
        userNameTextField.textFieldPlaceholderColor(placeholder: " KULLANICI ADI")
        
        passwordTextField.isSecureTextEntry = true
    }
    
    private func tryRegister(){
        var registerParameters = RegisterParameters()
        
        registerParameters.email  = emailTextField.text
        registerParameters.password = passwordTextField.text
        registerParameters.firstName = firstNameTextField.text
        registerParameters.lastName = lastNameTextField.text
        registerParameters.userName = userNameTextField.text
        
        UserService.instance.register(parameters: registerParameters) { result in
            
            if result.success {
                self.performSegue(withIdentifier: "toLoginPage", sender: nil)
            } else {
                AlertView.instance.showMessage(title: "Kayıt Hatası", message: result.message, type: .error)
            }
        }
    }

    @IBAction func register(_ sender: Any) {
        tryRegister()
    }
}
