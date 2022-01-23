//
//  BaseViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 21.12.2021.
//

import UIKit

class BaseViewController: UIViewController {

    private var expirationDate : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getText()()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    private func getText(){
        print("Text")
    }
}
