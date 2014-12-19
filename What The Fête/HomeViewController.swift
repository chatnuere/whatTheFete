//
//  HomeViewController.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 16/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDataSource ,UICollectionViewDataSource{
    
    private var soirees:[Soiree]=[Soiree]()
    private var peoples:[People]=[People]()
    private var users:[User]=[User]()

    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var tableScrollView: UIScrollView!
    @IBOutlet weak var formScrollView: UIScrollView!

    @IBOutlet weak var addFormButton: UIButton!
    @IBOutlet weak var backToHomeButton: UIButton!
    
    
    @IBOutlet weak var homePageTitle: UINavigationItem!
    
    // add soiree form outlet
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var soireTitleTexField: UITextField!
    @IBOutlet weak var soireeDescriptiontextField: UITextField!
    @IBOutlet weak var soireeDatePicker: UIDatePicker!
    @IBOutlet weak var imageCoverForm: UIImageView!
    
    private let cellIdentifier               = "soireeCellIdentifier"
    private let collectionCellIdentifier     = "userCollectionCellIdentifier"
    private let detailSoireeSegueIdentifier  = "SingleSoireeSegueIdentifier"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("_____ View Did Load _____")
        
        //http://dugue.today/soiree.json
        //https://www.dropbox.com/s/pimp87dtgn2wdae/wtf.json?dl=1
        Alamofire.request(.GET, "https://www.dropbox.com/s/pimp87dtgn2wdae/wtf.json?dl=1", parameters: nil, encoding: ParameterEncoding.URL).responseJSON { (urlRequest:NSURLRequest, response:NSHTTPURLResponse?, data:AnyObject?, error:NSError?) -> Void in
            
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
            self.mainCollectionView.reloadData()
            
            
        }
        
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        tableScrollView.hidden  = false
        formScrollView.hidden   = true
        backToHomeButton.hidden = true
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
    
    //MARK: - UICollectionView data source methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:UserCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier( collectionCellIdentifier, forIndexPath: indexPath) as UserCollectionViewCell
        
        cell.setUser(users[indexPath.row])
        
        return cell
        
        
        
    }
    
    //MARK: - Display table or form
    
    @IBAction func addFormAction(sender: AnyObject) {
        tableScrollView.hidden  = true
        formScrollView.hidden   = false
        backToHomeButton.hidden = false
        homePageTitle.title     = "Ajouter une soirée"
        addFormButton.hidden    = true
        ImageLoader.sharedLoader.imageForUrl("https://www.dropbox.com/s/oxap6tw09k02t1x/Event-global.png?dl=1", completionHandler:{(image: UIImage?, url: String) in
            self.imageCoverForm.image = image
        })
    }
    
    
    @IBAction func backToHomeButTonAction(sender: AnyObject) {
        tableScrollView.hidden  = false
        formScrollView.hidden   = true
        backToHomeButton.hidden = true
        homePageTitle.title     = "Accueil"
        addFormButton.hidden    = false
    }
    
    //MARK: - Add soiree
    func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }


    @IBAction func AddSoireeAction(sender: AnyObject) {
        if soireTitleTexField.text != "" && soireeDescriptiontextField.text != "" {
            
            // array of images
            
            var imageArray = ["https://www.dropbox.com/s/8up7qjf182fp505/Event-Friends.png?dl=1","https://www.dropbox.com/s/59w0nsasjgygbay/Event-bigbang.png?dl=1","https://www.dropbox.com/s/oxap6tw09k02t1x/Event-global.png?dl=1"]
            
            // setting up selected date
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "d-MM-yyyy"
            var soireeDate = dateFormatter.stringFromDate(soireeDatePicker.date)
            
            var soireeId = soirees.count
            
            var i = randRange( 0 ,  upper: 2)
            
            
            
            soirees.append(Soiree(soireeId: soireeId, title: soireTitleTexField.text, soireeDescription: soireeDescriptiontextField.text, date: soireeDate, coverpic: imageArray[i]))
            
            for index in 1...5 {
                peoples.append(People(people_id: peoples.count, user_id: index, event_id: soireeId , mark: "null", markBibine: "null", markDance: "null", markDrague: "null", markStyle: "null", markVanne: "null"))
            }
            
            self.mainTableView.reloadData()
            tableScrollView.hidden  = false
            formScrollView.hidden   = true
            backToHomeButton.hidden = true
            homePageTitle.title     = "Accueil"
            addFormButton.hidden    = false
            
            soireTitleTexField.text = ""
            soireeDescriptiontextField.text = ""
        }

    }

}
