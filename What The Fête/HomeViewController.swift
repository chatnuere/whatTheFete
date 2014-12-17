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
    
    private var soirees:[Soiree]=[Soiree]()
    
    @IBOutlet weak var mainTableView: UITableView!
    
    private let cellIdentifier = "soireeCellIdentifier"
    private let detailVideoGameSegueIdentifier = "SingleSoireeSegueIdentifier"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("_____ View Did Load _____")
        
        
        Alamofire.request(.GET, "http://www.dugue.today/soiree.json", parameters: nil, encoding: ParameterEncoding.URL).responseJSON { (urlRequest:NSURLRequest, response:NSHTTPURLResponse?, data:AnyObject?, error:NSError?) -> Void in
            
            var jsonObject = data as Dictionary<String,AnyObject>
            
            ///println("data : \(data)")
            
            var soireesFromJSON = jsonObject["soirees"] as [Dictionary<String,AnyObject>]
            
            for soireeFromJSON in soireesFromJSON {
                var name = soireeFromJSON["name"]
                var description = soireeFromJSON["description"]
                
                println("name : \(name)")
                println("description : \(description)")
            }
            
            
        }
        
      
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var segueIdentifier = segue.identifier
        
        if segueIdentifier==detailVideoGameSegueIdentifier {
            var detailSoireeViewController = segue.destinationViewController as DetailSoireeViewController
            
            if let indexRow = mainTableView.indexPathForSelectedRow()?.row {
                detailSoireeViewController.soiree = soirees[indexRow]
            }
        }
        
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
