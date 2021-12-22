//
//  TextFieldExtension.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 5.12.2021.
//

import Foundation
import UIKit

extension UITextField {
    
    // MARK: TextField Left Image
    func textFieldLeftImage(img : UIImage) {
        let leftImage = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImage.tintColor = UIColor.gray
        leftImage.image = img
        self.leftView = leftImage
        self.leftViewMode = .always
    }
    
    // MARK: TextField Right Image
    func textFieldRightButton(img : UIImage) {
        let leftImage = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImage.tintColor = UIColor.gray
        leftImage.image = img
        self.rightView = leftImage
        self.rightViewMode = .always
    }
    
    func textFieldLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.5)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    
    func textFieldPlaceholderColor(placeholder:String){
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
}
