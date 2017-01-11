//
//  ViewController.swift
//  Hello MVP
//
//  Created by Muhammad Azam Bin Baderi on 1/10/17.
//  Copyright © 2017 Muhammad Azam Bin Baderi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    fileprivate let userPresenter = UserPresenter(userService: UserService())
    fileprivate var usersToDisplay = [UserViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        activityIndicator?.hidesWhenStopped = true
        
        userPresenter.attachView(view: self)
        userPresenter.getUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "UserCell")
        let userViewData = usersToDisplay[indexPath.row]
        cell.textLabel?.text = userViewData.name
        cell.detailTextLabel?.text = userViewData.age
        return cell
    }
}

extension ViewController: UserView {
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func setUsers(users: [UserViewData]) {
        usersToDisplay = users
        tableView.isHidden = false
        emptyView.isHidden = true
        tableView.reloadData()
    }
    
    func setEmptyUsers() {
        tableView.isHidden = true
        emptyView.isHidden = false
    }
}
