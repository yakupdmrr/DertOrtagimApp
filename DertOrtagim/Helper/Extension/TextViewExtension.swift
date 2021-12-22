//
//  TextViewExtension.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 5.12.2021.
//

import Foundation
import UIKit


extension UITextView{
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
