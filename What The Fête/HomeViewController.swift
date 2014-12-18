//
//  HomeViewController.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 16/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDataSource {
    
    private var soirees:[Soiree]=[Soiree]()
    private var peoples:[People]=[People]()
    private var users:[User]=[User]()

    
    @IBOutlet weak var mainTableView: UITableView!

    
    
    
    private let cellIdentifier               = "soireeCellIdentifier"
    private let detailSoireeSegueIdentifier  = "SingleSoireeSegueIdentifier"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("_____ View Did Load _____")
        
        //http://dugue.today/soiree.json
        //https://www.dropbox.com/s/pimp87dtgn2wdae/wtf.json?dl=1
        Alamofire.request(.GET, "http://dugue.today/soiree.json", parameters: nil, encoding: ParameterEncoding.URL).responseJSON { (urlRequest:NSURLRequest, response:NSHTTPURLResponse?, data:AnyObject?, error:NSError?) -> Void in
            
            var jsonObject = data as Dictionary<String,AnyObject>
            
            
            /// prepare dictionaries to sort the JSON
            var soireesFromJSON = jsonObject["events"] as [Dictionary<String,AnyObject>]
            var usersFromJSON   = jsonObject["users"]  as [Dictionary<String,AnyObject>]
            var peoplesFromJSON = jsonObject["people"] as [Dictionary<String,AnyObject>]
            
            /// adding users
            for userFromJSON in usersFromJSON {
                var id: AnyObject!         = userFromJSON["id"]
                var firstname: AnyObject!  = userFromJSON["firstname"]
                var lastname: AnyObject!   = userFromJSON["lastname"]
                var pictureurl: AnyObject! = userFromJSON["pictureurl"]
                var user_title: AnyObject! = userFromJSON["user_title"]

                var user = User(userId: Int(id as NSNumber), firstname: "\(firstname)", lastname: "\(lastname)", pictureurl: "\(pictureurl)", user_title:"\(user_title)")
                self.users.append(user)
            }
            
            /// adding soirées
            for soireeFromJSON in soireesFromJSON {
                var id: AnyObject!          = soireeFromJSON["id"]
                var title: AnyObject!       = soireeFromJSON["title"]
                var description: AnyObject! = soireeFromJSON["description"]
                var date: AnyObject!        = soireeFromJSON["date"]
                var coverpic: AnyObject!    = soireeFromJSON["coverpic"]
                
                var soiree = Soiree( soireeId: Int(id as NSNumber), title: "\(title)", soireeDescription: "\(description)", date: "\(date)", coverpic: "\(coverpic)" )
                self.soirees.append(soiree)
            }
            
            /// adding peoples
                for peopleFromJSON in peoplesFromJSON {
                var people_id: AnyObject! = peopleFromJSON["id"]
                var user_id:   AnyObject! = peopleFromJSON["user_id"]
                var event_id:  AnyObject! = peopleFromJSON["event_id"]
                var mark:      AnyObject! = peopleFromJSON["mark"]
                var markBibine:AnyObject! = peopleFromJSON["mark-bibine"]
                var markDance: AnyObject! = peopleFromJSON["mark-dance"]
                var markDrague:AnyObject! = peopleFromJSON["mark-drague"]
                var markStyle: AnyObject! = peopleFromJSON["mark-style"]
                var markVanne: AnyObject! = peopleFromJSON["mark-vanne"]
                
                    var people = People(people_id: Int(people_id as NSNumber), user_id: Int(user_id as NSNumber), event_id: Int(event_id as NSNumber), mark: "\(mark)", markBibine: "\(markBibine)", markDance: "\(markDance)", markDrague: "\(markDrague)", markStyle: "\(markStyle)", markVanne: "\(markVanne)")
                self.peoples.append(people)
            }
            
            self.mainTableView.reloadData()
            
            
            
        }
        
      
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var segueIdentifier = segue.identifier
        
        if segueIdentifier==detailSoireeSegueIdentifier {
            var detailSoireeViewController = segue.destinationViewController as DetailSoireeViewController
            
            if let indexRow = mainTableView.indexPathForSelectedRow()?.row {
                detailSoireeViewController.soiree  = soirees[indexRow]
                detailSoireeViewController.users   = users
                detailSoireeViewController.peoples = peoples
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UITableView data source methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soirees.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:SoireeTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as SoireeTableViewCell
        
        cell.setSoiree(soirees[indexPath.row])
        
        return cell
    }


}
