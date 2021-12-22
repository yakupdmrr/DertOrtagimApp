//
//  CommentTableViewCell.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 18.12.2021.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentText: UILabel!
    @IBOutlet weak var userNameText: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        profileImage.layer.cornerRadius = 30
        
    }

}
