//
//  LoginViewController.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/13/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        let twitter  = TwitterClient.sharedInstance
        twitter?.login(success: { 
            print("I have logged in!")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }, failure: { (error) in
            print(error.localizedDescription)
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
