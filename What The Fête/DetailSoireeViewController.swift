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
    @IBOutlet weak var singleSoireeMonth: UILabel!
    @IBOutlet weak var singleSoireeDay: UILabel!
    
    @IBOutlet weak var usersTableview: UITableView!
    

    private let cellIdentifier               = "userCellIdentifier"
    private let detailParticipatingUsersSegueIdentifier  = "SingleParticipatingUsersSegueIdentifier"

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title                   = soiree.title
        singleSoireeTitle.text       = soiree.title
        singleSoireeDescription.text = soiree.soireeDescription
        
        let splitedDate              = split(soiree.date){$0 == "-"}
        let soireeDay                = splitedDate[0]
        
        var soireeMonth : String
        
        switch splitedDate[1] {
        case "01" :
            soireeMonth              = "JAN"
            break
        case "02" :
            soireeMonth              = "FEV"
            break
        case "03" :
            soireeMonth              = "MAR"
            break
        case "04" :
            soireeMonth              = "AVR"
            break
        case "05" :
            soireeMonth              = "MAI"
            break
        case "06" :
            soireeMonth              = "JUN"
            break
        case "07" :
            soireeMonth              = "JUL"
            break
        case "08" :
            soireeMonth              = "AOU"
            break
        case "09" :
            soireeMonth              = "SEP"
            break
        case "10" :
            soireeMonth              = "OCT"
            break
        case "11" :
            soireeMonth              = "NOV"
            break
        case "12" :
            soireeMonth              = "DEC"
            break
        default   :
            soireeMonth              = "No"
            break
            
        }
        
        
        
        singleSoireeMonth.text       = soireeMonth
        singleSoireeDay.text         = soireeDay
        
        ImageLoader.sharedLoader.imageForUrl(soiree.coverpic, completionHandler:{(image: UIImage?, url: String) in
            self.singleSoireeImage.image = image
        })
        

        // Do any additional setup after loading the view.
        
        
        for people in peoples {
            if people.event_id == soiree.soireeId{
                participatingUsers.append(users[people.user_id - 1])
            }
        }
        
        
        self.usersTableview.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
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
                for people in peoples{
                    if people.user_id == participatingUsers[indexRow].userId{
                        detailParticipatingUsersViewController.people = people
                    }
                }
                
                detailParticipatingUsersViewController.user  = participatingUsers[indexRow]
                detailParticipatingUsersViewController.soiree = soiree
                
            }
        }
        
    }
    
    
    //MARK: - UITableView data source methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participatingUsers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UserTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UserTableViewCell
        
        cell.setUser(participatingUsers[indexPath.row], peoples: peoples)
        
        return cell
    }


}
