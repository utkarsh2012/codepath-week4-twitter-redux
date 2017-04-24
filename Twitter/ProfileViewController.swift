//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/22/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var profileView: ProfileView!
    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet]!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
        
        if user == nil {
            user = User.currentUser
        }
        
        profileView.user = user
        
        // Configure navigation bar.
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor.blue
            navigationBar.tintColor = UIColor.white
            navigationBar.titleTextAttributes = [
                NSFontAttributeName : UIFont.boldSystemFont(ofSize: 22),
                NSForegroundColorAttributeName : UIColor.white
            ]
        }
        
        TwitterClient.sharedInstance?.statuses(user?.screenName ?? "", success: { (tweets: [Tweet]) in
            self.tweets = tweets
            self.tableView.reloadData()
        }, failure: { (error: Error) in
            print("Error: \(error.localizedDescription)")
        })    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
}
