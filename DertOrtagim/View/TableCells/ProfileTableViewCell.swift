//
//  ProfileTableViewCell.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 17.12.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    

    @IBOutlet weak var favoriteCountText: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var commentCountText: UILabel!
    @IBOutlet weak var postDateText: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var postText: UILabel!
    
    @IBOutlet weak var userNameText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        

        commentButton.setTitle("", for: .normal)
        favoriteButton.setTitle("", for: .normal)
        
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func commentButtonClicked(_ sender: Any) {
    }
    @IBAction func favoriteButtonClicked(_ sender: Any) {
    }
}
