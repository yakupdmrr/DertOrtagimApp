//
//  LoginViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 17.10.2021.
//

import UIKit

final class LoginViewController: UIViewController {
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldProperties()
        loginButton.buttonProperties()
    }
        
    private func textFieldProperties(){
        emailTextField.textFieldLine()
        passwordTextField.textFieldLine()
        
        let emailImage  = UIImage(systemName: "person")
        let passwordImage = UIImage(systemName: "key")
        
        if let imgEmail  = emailImage { emailTextField.textFieldLeftImage(img: imgEmail) }
        if let imgPassword = passwordImage { passwordTextField.textFieldLeftImage(img: imgPassword) }
        
        emailTextField.textFieldPlaceholderColor( placeholder: " USERNAME")
        passwordTextField.textFieldPlaceholderColor(placeholder: " PASSWORD")
        
        passwordTextField.isSecureTextEntry = true
    }
    
    private func tryLogin (){
        var loginParameters = LoginParameters()
        
        loginParameters.userName = emailTextField.text
        loginParameters.password = passwordTextField.text
        
        UserService.instance.login(parameters: loginParameters) { result in
                 if result.token != nil {
                    self.performSegue(withIdentifier: "toTabBarVC", sender: nil)
                     if let token = result.token {
                         LoginManager.instance.setToken(token: token)
                     }
                     if let expiration = result.expiration {
                         LoginManager.instance.setExpiration(expiration: expiration)
                     }
                } else {
                    AlertView.instance.showMessage(title: "HATA", message: "Giriş hatası", type: .warning)
                }
        }
    }
    
    // MARK: Login
    @IBAction func login(_ sender: Any) {
         tryLogin()
    }
    
    // MARK: Register to Page
    @IBAction func toRegisterPage(_ sender: Any) {
        
        
        
    }
}
