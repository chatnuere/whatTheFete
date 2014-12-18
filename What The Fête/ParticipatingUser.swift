//
//  ParticipatingUser.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 18/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class ParticipatingUser: NSObject {
    
    var userId:Int!
    var firstname:String!
    var lastname:String!
    var pictureurl:String!
    var user_title:String!
    
    
    init(  userId:Int!, firstname:String!, lastname:String!, pictureurl:String! , user_title:String!) {
        
        self.userId     = userId
        self.firstname  = firstname
        self.lastname   = lastname
        self.pictureurl = pictureurl
        self.user_title = user_title
        
    }
   
}
