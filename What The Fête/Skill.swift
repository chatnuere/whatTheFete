//
//  Skill.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 18/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class Skill: NSObject {
    
    var title:String!
    var desc:String!
    var picture:String!
    
    
    init( title:String!, desc:String!, picture:String! ) {
        
        self.title   = title
        self.desc    = desc
        self.picture = picture
        
    }
   
}
