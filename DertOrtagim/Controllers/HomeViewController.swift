//
//  HomeViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 30.10.2021.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak var postTableView: UITableView!
    private var postListViewModel : PostViewListModel?
    private lazy var chosenPost = Post()
    private var userIdList = [Int]()
    @IBOutlet weak var indicator: UIActivityIndicatorView!{
        didSet{
            indicator.hidesWhenStopped = true
        }
    }
    
    
    private let floatingButton : UIButton = {
        let button = UIButton(frame:CGRect(x: 0, y: 0, width: 60, height: 60))
        button.layer.cornerRadius = 30
        button.backgroundColor = .link
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(floatingButton)
        
        navigationControl()
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        getData()

    }
    
    private func navigationControl(){
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(refreshList))
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(gotoSettingVc))
    }
    
    @objc private func gotoSettingVc(){
        performSegue(withIdentifier: "gotoSettingVC", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let titleImageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        titleImageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo1")
        titleImageView.image = image
        
        
        navigationItem.titleView = titleImageView
    }
    

    @objc private func refreshList(){
        DispatchQueue.main.async{
            self.postListViewModel?.postList.removeAll(keepingCapacity: false)
            self.getData()
            self.indicator.stopAnimating()
            self.postTableView.reloadData()
        }
    }
    
    private func getData(){
        indicator.center = self.view.center
        indicator.startAnimating()
        
        PostService.instance.getAllPost { result in
            
            for i in result.data {
                self.userIdList.append(i.userId ?? 0)
            }
            
            self.postListViewModel = PostViewListModel(postList: result.data)
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.postTableView.reloadData()
            }
        }
       
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 75 , y: view.frame.size.height - 160, width: 60, height: 60)
        floatingButton.addTarget(self, action: #selector(addNewPostButtonClick), for: .touchUpInside)
    }

    
    @objc func addNewPostButtonClick(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "id") as! NewPostViewController
        self.present(vc, animated: true, completion: nil)
        
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PostDetailVC" {
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        chosenPost = self.postListViewModel.postList[indexPath.row]
        performSegue(withIdentifier: "PostDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListViewModel?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "homeTableCell", for: indexPath) as! HomeTableViewCell

        let postView = self.postListViewModel?.postAtIndex(indexPath.row)
        cell.postTextTxt.text = postView?.text
        
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US")
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        let date = dateFormatter.date(from: postView?.date ?? "")
//
//        let stringDate = dateFormatter.string(from: date)
        
        cell.postDateText.text = postView?.date
        
        
        if let likeCount = String(postView?.likeCount ?? 0) as? String {
            cell.favoriteCountText.text = likeCount
        }
        
        for i in userIdList {
            if i != 0 {
                if postView?.userId != nil {
                    if i == postView?.userId {
                        if let userID = String(postView?.userId ?? 0) as? String {
                            UserService.instance.getUserById(id: userID) { result in
                                cell.userNameLabel.text = result.userName
                            }
                        }
                    }
                }
            }
        }
        
        return cell
    }
}

