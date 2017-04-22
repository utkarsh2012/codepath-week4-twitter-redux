//
//  TweetDetailViewController.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/15/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    @IBOutlet weak var tweetView: TweetView!
    @IBOutlet weak var replyIconView: UIImageView!
    @IBOutlet weak var favoriteIconView: UIImageView!
    @IBOutlet weak var retweetIconView: UIImageView!
    
    var tweet: Tweet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetView.tweet = tweet
        
        if tweet?.retweeted != nil && tweet?.retweeted == true {
            retweetIconView.alpha = 1
        }
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.11, green:0.63, blue:0.95, alpha:1.00)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        
        let replyTap = UITapGestureRecognizer(target: self, action: #selector(replyIconTapped))
        replyIconView.addGestureRecognizer(replyTap)
        replyIconView.isUserInteractionEnabled = true
        
        let favTap = UITapGestureRecognizer(target: self, action: #selector(favIconTapped))
        favoriteIconView.addGestureRecognizer(favTap)
        favoriteIconView.isUserInteractionEnabled = true
        
        let retweetTap = UITapGestureRecognizer(target: self, action: #selector(retweetIconTapped))
        retweetIconView.addGestureRecognizer(retweetTap)
        retweetIconView.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onReplyButton(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "replyToTweetSegue" {
            if let navController = segue.destination as? UINavigationController {
                if let childVC = navController.topViewController as? NewTweetViewController {
                    childVC.tweet = tweet
                }
            }
        }
    }
    
    func replyIconTapped(){
        performSegue(withIdentifier: "replyToTweetSegue", sender: nil)
    }
    
    func favIconTapped(){
        TwitterClient.sharedInstance?.favorite(id: (tweet?.tweetId)!, action: nil, success: { (resp) in
            self.favoriteIconView.alpha = 1
        }, failure: { (error) in
            print(error)
        })
    }
    
    func retweetIconTapped(){
        TwitterClient.sharedInstance?.retweet(id: (tweet?.tweetId)!, success: { (tweet) in
            self.retweetIconView.alpha = 1
        }, failure: { (error) in
            print(error)
        })
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
