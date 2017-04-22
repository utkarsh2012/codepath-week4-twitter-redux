//
//  TweetView.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/15/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit
import AFNetworking

class TweetView: UIView {
    
    @IBOutlet weak var retweededBtLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var retweeCount: UILabel!
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var tweetLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            if tweet.retweeted != nil && tweet.retweeted! {
                retweededBtLabel.isHidden = false
                retweededBtLabel.text = "\(tweet.user?.screenName ?? "") retweeted"
            }

            usernameLabel.text = tweet.user?.screenName
            nameLabel.text = tweet.user?.name
            timestampLabel.text = tweet.timestampDateTime
            retweeCount.text = String(tweet.retweetCount)
            favoriteCount.text = String(tweet.favouriteCount)
            profilePicture.setImageWith((tweet.user?.profileUrl)!)
            tweetLabel.text = tweet.text
        }
    }
    
}
