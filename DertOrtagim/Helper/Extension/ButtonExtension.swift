//
//  ButtonExtension.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 5.12.2021.
//

import Foundation
import UIKit

extension UIButton{
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
    
    func buttonProperties(){
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = UIColor.link.cgColor
    }
}
