//
//  NewTweetViewController.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/15/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit
import AFNetworking

class NewTweetViewController: UIViewController {
    var tweet: Tweet?

    @IBOutlet weak var inReplyToLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var newTweetText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.11, green:0.63, blue:0.95, alpha:1.00)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        newTweetText.becomeFirstResponder()
        
        let currentUser = User.currentUser
        
        profileImage.setImageWith((currentUser?.profileUrl)!)
        nameLabel.text = currentUser?.name
        userNameLabel.text = currentUser?.screenName
        
        if tweet != nil {
            inReplyToLabel.isHidden = false
            inReplyToLabel.text = "Reply to \(tweet?.user?.screenName ?? "")"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTweetButton(_ sender: Any) {
        if self.tweet != nil {
            TwitterClient.sharedInstance?.replyToTweet(reply: newTweetText.text!, replyStatusId: (self.tweet?.tweetId)!, success: { (response) in
                print("Success tweet!")
                print(response)
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print(error)
            })
        } else {
            TwitterClient.sharedInstance?.tweet(status: newTweetText.text!, success: { (response) in
                print("Success tweet!")
                print(response)
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print(error)
            })
        }
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
