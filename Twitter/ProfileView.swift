//
//  ProfileView.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/22/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet weak var profileBackgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    
    var user: User? {
        didSet {
            nameLabel.text = user?.name
            screennameLabel.text = user?.screenName
            followerCountLabel.text = "\((user?.numberOfFollowers)!)"
            followingCountLabel.text = "\((user?.numberOfFriends)!)"
            tweetCountLabel.text = "\((user?.numberOfTweets)!)"
            profileImageView.setImageWith((user?.profileUrl)!)
            UIView.animate(withDuration: 0.15) {
                self.profileImageView.alpha = 1.0
                self.profileBackgroundImageView.alpha = 1.0
            }
        }
    }
    
    override func awakeFromNib() {
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
    }

}
