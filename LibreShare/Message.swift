//
//  Message.swift
//  LibreShare
//
//  Created by roger deutsch on 3/10/19.
//  Copyright © 2019 Roger Deutsch. All rights reserved.
//

import Foundation

class Message{
    var note : String
    init(){
        note = ""
    }
    func toAnyObject() -> Any {
        return [
            "note" : note
        ]
    }
}

