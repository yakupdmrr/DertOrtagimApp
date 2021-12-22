//
//  AlertView.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 11.11.2021.
//

import Foundation
import UIKit

class AlertView : UIView {
   static let instance = AlertView()
    
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var alertMessage: UILabel!
    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet var parentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        initFunction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFunction(){
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showMessage(title: String, message: String,type: AlertType)  {
        
        alertTitle.text = title
        alertMessage.text = message
        doneButton.setTitle("Tamam", for: .normal)
        
        switch type {
        case .success:
            alertImageView.image = UIImage(systemName: "checkmark.circle.fill")
            alertView.tintColor = UIColor.systemGreen
            doneButton.backgroundColor = UIColor.systemGreen
        case .error:
            alertImageView.image = UIImage(systemName: "multiply.circle.fill")
            alertView.tintColor = UIColor.red
            doneButton.backgroundColor = UIColor.red
        case .warning:
            alertImageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
            alertView.tintColor = UIColor.orange
            doneButton.backgroundColor = UIColor.orange
        }
        alertViewProp()
        
    }
    
    func showMessage(message : String, type : AlertType , completion : @escaping () -> Void ) {
        
        alertMessage.text = message
        
        doneButton.setTitle("Tamam", for: .normal)
        
        switch type {
        case .success:
            alertImageView.image = UIImage(systemName: "checkmark.circle.fill")
            alertView.tintColor = UIColor.systemGreen
            doneButton.backgroundColor = UIColor.systemGreen
        case .error:
            alertImageView.image = UIImage(systemName: "multiply.circle.fill")
            alertView.tintColor = UIColor.red
            doneButton.backgroundColor = UIColor.red
        case .warning:
            alertImageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
            alertView.tintColor = UIColor.orange
            doneButton.backgroundColor = UIColor.orange
        }
        alertViewProp()
        
    }
    
    private func alertViewProp(){
        if #available(iOS 13, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            
            keyWindow?.addSubview(parentView)
        } else {
            UIApplication.shared.keyWindow?.addSubview(parentView)
        }
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
    
    enum AlertType : String{
        case success = "success"
        case warning = "warning"
        case error = "error"
    }
}
