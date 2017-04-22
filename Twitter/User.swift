//
//  User.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/14/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit

class User: NSObject {

    var name : String?
    var screenName: String?
    var profileUrl: URL?
    var tagLine: String?
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
     
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlStringExists = profileUrlString {
            profileUrl = URL(string: profileUrlStringExists)
        }
        
        tagLine = dictionary["description"] as? String
    }
    
    static let userDidLogoutNotification = "UserDidLogout"
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
                
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: "currentUserData") as? Data
                
                if let userData = userData {
                    print("\(userData)")
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        
        set(user) {
            _currentUser = user
            let defaults = UserDefaults.standard
            if let user = user {
                let userData = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(userData, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
            defaults.synchronize()
        }
    }
}
