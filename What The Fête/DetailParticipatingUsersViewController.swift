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
    var rating = Rating(alcohol: 0, dance: 0, women: 0, swag: 0, fun: 0)
    var skills:[Skill]=[Skill]()
    var step = 0
    var mark:Float!
    
    


    /// function to blur background image
    
    func applyBlurEffect(image: UIImage){
        var imageToBlur = CIImage(image: image)
        var blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter.setValue(imageToBlur, forKey: "inputImage")
        var resultImage = blurfilter.valueForKey("outputImage") as CIImage
        var blurredImage = UIImage(CIImage: resultImage)
        self.bacgroundSoireeCoverPic.image = blurredImage
        
    }
    

    
    
    
    
    // général
    @IBOutlet weak var bacgroundSoireeCoverPic: UIImageView!
    @IBOutlet weak var currentFriendProfilePic: UIImageView!
    @IBOutlet weak var soireeTitle: UILabel!
    @IBOutlet weak var soireeDescription: UILabel!
    @IBOutlet weak var soireeDate: UILabel!
    @IBOutlet weak var headerNoteView: UIView!
    @IBOutlet weak var headerNotelabel: UILabel!
    
    
    
    // view du formulare de notes
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
    
    /// view report
    @IBOutlet weak var reportWrappingView: UIView!
    @IBOutlet weak var titreReportMark: UILabel!
    @IBOutlet weak var noteDance: UILabel!
    @IBOutlet weak var noteAlcool: UILabel!
    @IBOutlet weak var noteSwag: UILabel!
    @IBOutlet weak var noteVannes: UILabel!
    @IBOutlet weak var notesex: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title             = "\(user.firstname) \(user.lastname)"
        soireeTitle.text       = soiree.title
        soireeDescription.text = soiree.soireeDescription
        soireeDate.text        = soiree.date
        
    
        
        
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


        // setting up the array of skills
        
        skills.append(Skill(title: "Resistance ethylique", desc: "Combien mérite "+user.firstname+" pour sa consommation d'alcool?", picture: ""))
        skills.append(Skill(title: "Contrôle du dancefloor", desc: "Combien mérite "+user.firstname+" pour son déhanché brésilien?", picture: ""))
        skills.append(Skill(title: "Sex appeal", desc: "Combien mérite "+user.firstname+" pour ses conquêtes?", picture: ""))
        skills.append(Skill(title: "Style vestimentaire", desc: "Combien mérite "+user.firstname+" pour son SWAG ( par rapport à rémy)?", picture: ""))
        skills.append(Skill(title: "Maitrîse de la vanne", desc: "Combien mérite "+user.firstname+" pour sa répartie?", picture: ""))

    }
    
    override func viewWillAppear(animated: Bool) {
        if people.mark == "null"{
            ratingWrappingView.hidden = false
            reportWrappingView.hidden = true
            headerNoteView.hidden     = true
            step = 0
            
            
        // setting up the form for step 1
            
            ratingSkillId.text          = "\(step+1)"
            ratingSkillTitle.text       = skills[step].title
            ratingSkillDescription.text = skills[step].desc
            
            
            
            
            
        }else{
            ratingWrappingView.hidden = true
            reportWrappingView.hidden = false
            headerNoteView.hidden     = false
            
            headerNotelabel.text = people.mark
            titreReportMark.text = "Répartition des notes de " + user.firstname
            noteDance.text       = people.markDance
            noteAlcool.text      = people.markBibine
            noteSwag.text        = people.markStyle
            noteVannes.text      = people.markVanne
            notesex.text         = people.markDrague
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func nextSkillAction(sender: AnyObject) {
        
        println("click")
        switch step
        {
        case 0:
            println("case 1")
            rating.alcohol = RatingSlider.value
            nextStep()
        case 1:
            println("case 2")
            rating.dance = RatingSlider.value
            nextStep()
        case 2:
            rating.women = RatingSlider.value
            nextStep()
        case 3:
            rating.swag = RatingSlider.value
            nextStep()
        case 4:
            rating.fun        = RatingSlider.value
            mark              = (rating.alcohol+rating.dance+rating.women+rating.swag+rating.fun)/5
            people.mark       = "\(round(mark))"
            people.markBibine = "\(Int(rating.alcohol))"
            people.markDance  = "\(Int(rating.dance))"
            people.markDrague = "\(Int(rating.women))"
            people.markStyle  = "\(Int(rating.swag))"
            people.markVanne  = "\(Int(rating.fun))"

        default:
            true
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func nextStep() {
        // setting up the form for step 
        
        ++step
        
        ratingSkillId.text          = "\(step+1)"
        ratingSkillTitle.text       = skills[step].title
        ratingSkillDescription.text = skills[step].desc
        
        
    }


    
    


}
