//
//  MentionsViewController.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/23/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit

class MentionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    var tweets: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 80.0
        
        // Configure navigation bar.
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.tintColor = UIColor.white
            navigationBar.titleTextAttributes = [
                NSFontAttributeName : UIFont.boldSystemFont(ofSize: 22),
                NSForegroundColorAttributeName : UIColor.white
            ]
        }
        
        TwitterClient.sharedInstance?.mentions(success: { (tweets: [Tweet]) in
            self.tweets = tweets
            self.tableview.reloadData()
        }, failure: { (error: Error) in
            print("Error: \(error.localizedDescription)")
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
