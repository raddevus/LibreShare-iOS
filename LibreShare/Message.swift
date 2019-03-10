//
//  Message.swift
//  LibreShare
//
//  Created by roger deutsch on 3/10/19.
//  Copyright © 2019 Roger Deutsch. All rights reserved.
//

import Foundation

class Message : Hashable{
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs == rhs
    }
    
    var note : String
    var _id : Int
    init(){
        note = ""
        _id = 1
    }
    func toAnyObject() -> Any {
        return [
            "_id" : _id,
            "note" : note
            
        ]
    }
    var hashValue: Int {
        return 1
    }

}

