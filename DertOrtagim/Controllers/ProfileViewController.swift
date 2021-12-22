//
//  ProfileViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 30.10.2021.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var userNameText: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = 40
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
        
    }
    
}
extension ProfileViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as! ProfileTableViewCell
        cell.profileImage.image = UIImage(named: "profilePhoto")
        cell.userNameText.text = "yakupdmrr"
        cell.commentCountText.text = "2"
        cell.favoriteCountText.text = "4"
        cell.postText.text = "Yakup Demir Yakup Demir Yakup Demir"
        cell.postDateText.text = "17.12.2021"
        return cell
    }
    
    
}

