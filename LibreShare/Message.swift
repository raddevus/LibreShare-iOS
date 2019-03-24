//
//  Message.swift
//  LibreShare
//
//  Created by roger deutsch on 3/10/19.
//  Copyright © 2019 Roger Deutsch. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class Message :  NSObject {
    init(id : NSNumber, note : String, isComplete : Bool ){
        self._id =  id
        self.note = note
        self.isComplete = isComplete
    }
    
    init(snapshot: DataSnapshot) {
        var x = snapshot.value as AnyObject
        self._id = x["_id"] as! NSNumber
        self.note = x["note"] as! String
        self.isComplete = x["isComplete"] as! Bool
    }
    
    var note : String
    var _id : NSNumber
    var isComplete : Bool
    override init(){
        note = ""
        _id = 3
        isComplete = false
    }
    
    func toAnyObject() -> Any {
        return [
            "_id" : _id,
            "note" : note,
            "isComplete" : isComplete
        ]
    }
}

extension Dictionary where Key: NSObject, Value:AnyObject {
    
    var jsonString:String {
        
        do {
            let stringData = try JSONSerialization.data(withJSONObject: self as NSDictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let string = String(data: stringData, encoding: String.Encoding.utf8){
                return string
            }
        }catch _ {
            
        }
        return ""
    }
}
