//
//  Utility.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 7.10.2021.
//

import Foundation
import UIKit

class Utility {
        
    static let instance = Utility()

    // TextFiled Property
    func textFieldLine(textField : UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.5)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    
    
    func textFieldAddImage(textField : UITextField , img : UIImage) {
        let leftImage = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImage.tintColor = UIColor.gray
        leftImage.image = img
        textField.leftView = leftImage
        textField.leftViewMode = .always
    }
    
    func buttonProperties(button:UIButton){
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowColor = UIColor.link.cgColor
    }
    
}
