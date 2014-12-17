//
//  AddSoireeViewController.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 17/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

protocol AddSoireeViewControllerDelegate {
    func didAddSoiree(soiree:Soiree)
}

class AddSoireeViewController: UIViewController {
    
    
    var  soirees:[Soiree]=[Soiree]()
    
    
    @IBOutlet weak var SoireeTitleTextField: UITextField!
    @IBOutlet weak var SoireeDateTextField: UITextField!
    @IBOutlet weak var SoireeDescription: UITextView!
    
    var delegate:AddSoireeViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddSoiree(sender: AnyObject) {
        
        var title = SoireeTitleTextField.text
        var description = SoireeDescription.text
        var alertMessage:String?=nil
        
        if title.isEmpty {
            alertMessage = "Veuillez remplir le titre, s'il vous plaît!"
        }
        else if(description==nil) {
            alertMessage = "Veuillez remplir la description, s'il vous plaît!"
        }
        
        if let message=alertMessage {
            var alertViewController = UIAlertController(title: "Attention", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertViewController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertViewController, animated: true, completion: nil)
            
            return
        }
        
     //   var soiree = Soiree(id:soirees.count ,name: title, soireeDescription:description!)
        //soirees.append(soiree)
        
       // mainTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: soirees.count-1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
        
        SoireeTitleTextField.resignFirstResponder()
        SoireeDescription.resignFirstResponder()
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
