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
    var markBibine:String!
    var markDance:String!
    var markDrague:String!
    var markStyle:String!
    var markVanne:String!
    
    init(  people_id:Int!,user_id:Int!,event_id:Int!, mark:String!, markBibine:String!, markDance:String!, markDrague:String!, markStyle:String!, markVanne:String! ) {
        
        self.people_id  = people_id
        self.user_id    = user_id
        self.event_id   = event_id
        self.mark       = mark
        self.markBibine = markBibine
        self.markDance  = markDance
        self.markDrague = markDrague
        self.markStyle  = markStyle
        self.markVanne  = markVanne
        
    }

    
}
