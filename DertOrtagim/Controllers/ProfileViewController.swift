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
    override func viewDidLoad() {
        super.viewDidLoad()
        

        navigationControl()
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let titleImageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        titleImageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo1")
        titleImageView.image = image
        
        
        navigationItem.titleView = titleImageView
    }
    
    
    private func navigationControl(){
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(searchButtonClicked))
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(gotoSettingVc))
    }
    
    @objc private func gotoSettingVc(){
        performSegue(withIdentifier: "gotoSettingVC", sender: nil)
    }
    
    @objc private func searchButtonClicked(){
        print("SearchView")
    }
    
}
extension ProfileViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as! ProfileTableViewCell

        cell.userNameText.text = "yakupdmrr"
        cell.commentCountText.text = "2"
        cell.favoriteCountText.text = "4"
        cell.postText.text = "Yakup Demir Yakup Demir Yakup Demir"
        cell.postDateText.text = "17.12.2021"
        return cell
    }
    
    
}

