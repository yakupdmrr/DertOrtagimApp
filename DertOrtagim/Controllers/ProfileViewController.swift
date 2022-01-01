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
    @IBOutlet weak var fullnameText: UILabel!
    private var postListViewModel : PostViewListModel?
    @IBOutlet weak var emailText: UILabel!
    private lazy var chosenPost = Post()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationControl()
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
        
        getData()
        getUserDetail()
      
    }
    
    private func getUserDetail(){
        if let userID = String(Utility.instance.getUserId()) as? String {
            UserService.instance.getUserById(id: userID) { result in
                if let firstName = result.firstName {
                    if let lastName = result.lastName {
                        self.fullnameText.text = firstName  + " " + lastName
                    }
                }
                if let email = result.eMail {
                    self.emailText.text = email
                }
                if let userName = result.userName {
                    self.userNameText.text = userName
                }
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let titleImageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        titleImageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo1")
        titleImageView.image = image
        
        
        navigationItem.titleView = titleImageView
    }
    
    private func getData(){
        PostService.instance.getPostsById(id: String(Utility.instance.getUserId())) { result in
            self.postListViewModel = PostViewListModel(postList: result.data)
            
            DispatchQueue.main.async {
                self.profileTableView.reloadData()
            }
        }
    }
    
    
    private func navigationControl(){
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(refreshButton))
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(gotoSettingVc))
    }
    
    @objc private func gotoSettingVc(){
        performSegue(withIdentifier: "gotoSettingVC", sender: nil)
    }
    
    @objc private func refreshButton(){
        DispatchQueue.main.async{
            self.postListViewModel?.postList.removeAll(keepingCapacity: false)
            self.getData()
            self.profileTableView.reloadData()
        }
    }
    
}
extension ProfileViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListViewModel?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as! ProfileTableViewCell

        
        let postView = self.postListViewModel?.postAtIndex(indexPath.row)
        cell.postText.text = postView?.text
        
        
        let splitDate = postView?.date.components(separatedBy: "T")
        
        if let fulldate = splitDate?[0]{
            cell.postDateText.text = fulldate
        }
        
        
        if let likeCount = String(postView?.likeCount ?? 0) as? String {
            cell.favoriteCountText.text = likeCount
        }
        if let userID = String(postView?.userId ?? 0) as? String {
            UserService.instance.getUserById(id: userID) { result in
                cell.userNameText.text = result.userName
            }
        }
        return cell
    }
    
    
}

