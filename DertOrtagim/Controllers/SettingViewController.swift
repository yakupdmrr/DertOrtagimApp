//
//  SettingViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 26.12.2021.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var passwordChangeButton: UIButton!
    @IBOutlet weak var userInfoButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func userInfoButtonClicked(_ sender: Any) {
    }
    
    @IBAction func passwordChangeButtonClicked(_ sender: Any) {
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        let alert  = UIAlertController(title: "Çıkmak İstiyor musunuz ?", message: "Çıkmak tıklayın.", preferredStyle: UIAlertController.Style.alert)
        let okeyButton = UIAlertAction(title: "Çıkış", style: UIAlertAction.Style.default) { action in
            self.performSegue(withIdentifier: "loginVC", sender: nil)
            LoginManager.instance.setToken(token: "")
        }
        let cancelButton = UIAlertAction(title: "İptal", style: UIAlertAction.Style.default) { action in }
        
        alert.addAction(okeyButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
