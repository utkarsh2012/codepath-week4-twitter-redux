//
//  Tweet.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/14/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: String?
    var timestamp: Date?
    var timestampDate: String?
    var timestampDateTime: String?
    var retweeted: Bool?
    var tweetId: String?
    
    var retweetCount: Int = 0
    var favouriteCount: Int = 0
    var user: User?
    
    init(dictionary: NSDictionary) {
        
        tweetId = dictionary["id_str"] as? String
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favouriteCount = (dictionary["favourites_count"] as? Int) ?? 0
        user = User(dictionary: (dictionary["user"] as? NSDictionary)!)
        retweeted = (dictionary["retweeted"] as? Bool) ?? false
        
        let timestampString = dictionary["created_at"] as? String
        
        if let timestampString = timestampString {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.date(from: timestampString)
            formatter.dateFormat = "MM/dd/yy H:mm a"
            timestampDateTime = formatter.string(from: timestamp! as Date)
            formatter.dateFormat = "MM/dd/yy"
            timestampDate = formatter.string(from: timestamp! as Date)
        }
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        for dict in dictionaries {
            let tweet = Tweet(dictionary: dict)
            tweets.append(tweet)
        }
        
        return tweets
    }
}
