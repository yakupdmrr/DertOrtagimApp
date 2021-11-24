//
//  HomeTableViewCell.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 30.10.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var postTextTxt: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = 30
        favoriteButton.setTitle("", for: .normal)
        commentButton.setTitle("", for: .normal)
        
        favoriteButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .selected)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

        
    @IBAction func favoriteButtonClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

    }
    
    
    @IBAction func commentButtonClick(_ sender: Any) {
        
        AlertView.instance.showMessage(title: "Comment Title", message: "Comment Message Comment Message Comment Message ", type: .success)
    }
    
}
