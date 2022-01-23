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
    
    private var userNameText: String = String()
    var selectPost = Post()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserById()

        favoriteButton.setTitle("", for: .normal)
        commentButton.setTitle("", for: .normal)
        
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
        getData()
    }
    
    private func getUserById(){
        UserService.instance.getUserById(id:  String(selectPost.userId ?? 0)) { result in
            self.userNameText = result.userName ?? ""
        }
    }
    
    private func getData(){
        postText.text = selectPost.text
        userName.text = userNameText
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
        cell.userNameText.text = "yakupdmrr"
        cell.commentText.text = "Comment"
        return cell
    }
    
    
}
