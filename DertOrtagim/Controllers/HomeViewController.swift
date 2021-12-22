//
//  HomeViewController.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 30.10.2021.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak var postTableView: UITableView!
    
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

    }
    
    private func navigationControl(){
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(searchButtonClicked))
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(gotoSettingVC))
    }
    
    @objc private func gotoSettingVC(){
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let titleImageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        titleImageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo")
        titleImageView.image = image
        
        
        navigationItem.titleView = titleImageView
    }
    

    @objc private func searchButtonClicked(){
        print("SearchView")
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
        performSegue(withIdentifier: "PostDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "homeTableCell", for: indexPath) as! HomeTableViewCell
        cell.userImage.image = UIImage(named: "profilePhoto")
        cell.userNameLabel.text = "yakupdmrr"
        cell.postTextTxt.text = "Officia veniam ad cillum laboris ut aute. Nostrud aute consequat ea eu voluptate non. Anim incididunt ullamco velit quis eiusmod eiusmod cupidatat veniam."
        cell.postDateText.text = "17.12.2021"
        cell.favoriteCountText.text = "2"
        cell.commentCountText.text = "1"
        return cell
    }
}

