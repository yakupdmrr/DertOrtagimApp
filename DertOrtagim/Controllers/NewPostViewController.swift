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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        postTextView.text = "Derdini Paylaş..."
        postTextView.textColor = UIColor.lightGray
        postTextView.delegate = self
        
    }
    
    private func createAPost(){

        var createPostParameters = CreatePostParameters()
        
        let date = Date()
        createPostParameters.userId = Utility.instance.getUserId()
        createPostParameters.text = postTextView.text
        createPostParameters.createDate = Utility.instance.dateFormatter(date: date)
        
        PostService.instance.createPost(parameters: createPostParameters) { result in
            if result.success {
                AlertView.instance.showMessage(title: "Başarılı İşlem", message: "Başarılı Post İşlemi", type: .success)
                self.dismiss(animated: true, completion: nil)
                
            } else {
                AlertView.instance.showMessage(title: "Başarısız İşlem", message: "Başarısız Post İşlemi", type: .warning)
            }
        }
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
        createAPost()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
