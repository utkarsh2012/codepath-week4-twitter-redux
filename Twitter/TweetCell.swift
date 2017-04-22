//
//  TweetCell.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/14/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetIconView: UIImageView!

    var tweet: Tweet! {
        didSet {
            nameLabel.text = tweet.user?.name
            usernameLabel.text = "@\((tweet.user?.screenName)!)"
            tweetTextLabel.text = tweet.text
            profileImageView.setImageWith((tweet.user?.profileUrl)!)
            UIView.animate(withDuration: 0.15, animations: { () -> Void in
                self.profileImageView.alpha = 1.0
            })
            if let since = tweet.timestamp?.timeIntervalSinceNow {
                let hours = round(since / 3600.0) * -1.0
                if hours < 24 {
                    timeLabel.text = "\(Int(hours))H"
                } else {
                    timeLabel.text = "\(tweet.timestampDate!)"
                }
            }
            
            if tweet.retweeted != nil && tweet.retweeted! {
                retweetLabel.isHidden = false
                retweetLabel.text = "\(tweet.user?.screenName ?? "") retweeted"
                retweetIconView.alpha = 1
            }
        }
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        usernameLabel.text = nil
        tweetTextLabel.text = nil
        profileImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
