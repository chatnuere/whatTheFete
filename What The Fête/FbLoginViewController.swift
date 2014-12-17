//
//  FbLoginViewController.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 16/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class FbLoginViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!

    var didFetchUserInfo:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }
    
    
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!,user: FBGraphUser) {
//        println("User Logged In")
        
        
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
//        println("User: \(user)")
//        println("User ID: \(user.objectID)")
//        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
//        println("User Email: \(userEmail)")
        
        if !didFetchUserInfo {
            self.performSegueWithIdentifier("loggedSegue", sender: user)
        }
        
        didFetchUserInfo = true
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!, user: FBGraphUser) {
//        println("User Logged Out")
        

    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

