//
//  DetailParticipatingUsersViewController.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 17/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class DetailParticipatingUsersViewController: UIViewController {
    
    var user:User!
    var soiree:Soiree!
    var people:People!
    
    func applyBlurEffect(image: UIImage){
        var imageToBlur = CIImage(image: image)
        var blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter.setValue(imageToBlur, forKey: "inputImage")
        var resultImage = blurfilter.valueForKey("outputImage") as CIImage
        var blurredImage = UIImage(CIImage: resultImage)
        self.bacgroundSoireeCoverPic.image = blurredImage
        
    }
    
    
    @IBOutlet weak var bacgroundSoireeCoverPic: UIImageView!
    @IBOutlet weak var currentFriendProfilePic: UIImageView!
    @IBOutlet weak var soireeTitle: UILabel!
    @IBOutlet weak var soireeDescription: UILabel!
    @IBOutlet weak var soireeDate: UILabel!
    @IBOutlet weak var ratingWrappingView: UIView!
    @IBOutlet weak var skill1colorView: UIView!
    @IBOutlet weak var skill2colorView: UIView!
    @IBOutlet weak var skill3colorView: UIView!
    @IBOutlet weak var skill4colorView: UIView!
    @IBOutlet weak var skill5colorView: UIView!
    @IBOutlet weak var ratingInsideView: UIView!
    @IBOutlet weak var ratingSkillTitle: UILabel!
    @IBOutlet weak var ratingSkillDescription: UILabel!
    @IBOutlet weak var ratingSkillId: UILabel!
    @IBOutlet weak var ratinSkillImg: UIImageView!
    @IBOutlet weak var RatingSlider: UISlider!
    @IBOutlet weak var ratingNextSkillButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title             = "\(user.firstname) \(user.lastname)"
        soireeTitle.text       = soiree.title
        soireeDescription.text = soiree.soireeDescription
        soireeDate.text        = soiree.date
        
        
        println(people.people_id)
        
        
        //Construct the imgUrl to get an image URL for the pages
        let bacgroundSoireeCoverPicurlString: NSString = soiree.coverpic as NSString
        var bacgroundSoireeCoverPicimgURL: NSURL       = NSURL(string: bacgroundSoireeCoverPicurlString)!
        var bacgroundSoireeCoverPicimgData: NSData     = NSData(contentsOfURL: bacgroundSoireeCoverPicimgURL)!
        
        ///append each image into UIImage
        bacgroundSoireeCoverPic.image    = UIImage(data: bacgroundSoireeCoverPicimgData)!
        
        applyBlurEffect(bacgroundSoireeCoverPic.image! )
        

        
        
        //Construct the imgUrl to get an image URL for the pages
        let currentFriendProfilePicurlString: NSString = user.pictureurl as NSString
        var currentFriendProfilePicimgURL: NSURL       = NSURL(string: currentFriendProfilePicurlString)!
        var currentFriendProfilePicimgData: NSData     = NSData(contentsOfURL: currentFriendProfilePicimgURL)!
        
        ///append each image into UIImage
        currentFriendProfilePic.image    = UIImage(data: currentFriendProfilePicimgData)!


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        if people.mark == "null"{
            ratingWrappingView.hidden = false
        }else{
            ratingWrappingView.hidden = true
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
    
    


}
