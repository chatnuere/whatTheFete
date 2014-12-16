//
//  HomeViewController.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 16/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("_____ View Did Load _____")
        
        Alamofire.request(.GET, "https://www.dropbox.com/s/pimp87dtgn2wdae/wtf.json?dl=1")
            .responseJSON { (_, _, JSON, _) in
                println(JSON)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
