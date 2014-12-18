//
//  People.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 17/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class People: NSObject {
    
    var people_id:Int!
    var user_id:Int!
    var event_id:Int!
    var mark:String!
    
    init(  people_id:Int!,user_id:Int!,event_id:Int!, mark:String! ) {
        
        self.people_id = people_id
        self.user_id   = user_id
        self.event_id  = event_id
        self.mark      = mark
        
    }
    
}
