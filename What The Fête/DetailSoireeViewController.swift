//
//  DetailSoireeViewController.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 17/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class DetailSoireeViewController: UIViewController , UITableViewDataSource {
    
    var soiree:Soiree!
    var peoples:[People]=[People]()
    var users:[User]=[User]()
    var participatingUsers:[User]=[User]()
    
    @IBOutlet weak var singleSoireeImage: UIImageView!
    @IBOutlet weak var singleSoireeTitle: UILabel!
    @IBOutlet weak var singleSoireeDescription: UILabel!
    @IBOutlet weak var singleSoireeDate: UILabel!
    
    @IBOutlet weak var usersTableview: UITableView!
    

    private let cellIdentifier               = "userCellIdentifier"
    private let detailParticipatingUsersSegueIdentifier  = "SingleParticipatingUsersSegueIdentifier"

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title                   = soiree.title
        singleSoireeTitle.text       = soiree.title
        singleSoireeDescription.text = soiree.soireeDescription
        singleSoireeDate.text        = soiree.date
        
        
        //Construct the imgUrl to get an image URL for the pages
        let urlString: NSString = soiree.coverpic as NSString
        var imgURL: NSURL       = NSURL(string: urlString)!
        var imgData: NSData     = NSData(contentsOfURL: imgURL)!
        
        ///append each image into UIImage
        singleSoireeImage.image    = UIImage(data: imgData)!
        

        // Do any additional setup after loading the view.
        
        
        for people in peoples {
            if people.event_id == soiree.soireeId{
                participatingUsers.append(users[people.user_id])
            }
        }
        
        
        self.usersTableview.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var segueIdentifier = segue.identifier
        
        if segueIdentifier==detailParticipatingUsersSegueIdentifier {
            var detailParticipatingUsersViewController = segue.destinationViewController as DetailParticipatingUsersViewController
            
            if let indexRow = usersTableview.indexPathForSelectedRow()?.row {
                detailParticipatingUsersViewController.user  = participatingUsers[indexRow]
                detailParticipatingUsersViewController.soiree = soiree
                detailParticipatingUsersViewController.peoples = peoples
            }
        }
        
    }
    
    
    //MARK: - UITableView data source methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participatingUsers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UserTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UserTableViewCell
        
        cell.setUser(participatingUsers[indexPath.row])
        
        return cell
    }


}
