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
        
        textFieldProp()
        Utility.instance.buttonProperties(button: loginButton)
    }
    

    
    private func textFieldProp(){
        Utility.instance.textFieldLine(textField: emailTextField)
        Utility.instance.textFieldLine(textField: passwordTextField)
        
        let emailImage  = UIImage(systemName: "envelope")
        let passwordImage = UIImage(systemName: "key")
        
        if let imgEmail  = emailImage { Utility.instance.textFieldAddImage(textField: emailTextField, img: imgEmail) }
        if let imgPassword = passwordImage { Utility.instance.textFieldAddImage(textField: passwordTextField, img: imgPassword) }
        
        Utility.instance.textFieldPlaceholderColor(textField: emailTextField, placeholder: " EMAİL")
        Utility.instance.textFieldPlaceholderColor(textField: passwordTextField, placeholder: " PASSWORD")
        
        passwordTextField.isSecureTextEntry = true
    }
    
    
    // MARK: LOGİN
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "toTabBarVC", sender: nil)
    }
    
    // MARK: REGISTER TO PAGE
    @IBAction func toRegisterPage(_ sender: Any) {
        
        
    }
    
    
}
