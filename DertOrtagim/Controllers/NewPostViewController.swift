//
//  NewPostViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 10.11.2021.
//

import UIKit

final class NewPostViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = 25
        postTextView.text = "Derdini Paylaş..."
        postTextView.textColor = UIColor.lightGray
        postTextView.delegate = self
                
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Derdini Paylaş..."
            textView.textColor = UIColor.lightGray
        }
    }
    
    // MARK: Shared Post
    @IBAction func shareButtonClicked(_ sender: Any) {
       
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
