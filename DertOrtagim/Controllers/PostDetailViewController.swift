//
//  PostDetailViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 18.12.2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet weak var postDateText: UILabel!
    
    @IBOutlet weak var favoriteCountText: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var commentCountText: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        userImage.layer.cornerRadius = 30
        favoriteButton.setTitle("", for: .normal)
        commentButton.setTitle("", for: .normal)
        
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
    }
    
    
    @IBAction func commentClicked(_ sender: Any) {
        print("Clicked Comment Button")
    }
    
    @IBAction func favoriteClicked(_ sender: Any) {
        print("Favorite Button Clicked")
    }
}
extension PostDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as!  CommentTableViewCell
        cell.profileImage.image = UIImage(named: "profilePhoto")
        cell.userNameText.text = "yakupdmrr"
        cell.commentText.text = "Güzel bir yorum"
        return cell
    }
    
    
}
