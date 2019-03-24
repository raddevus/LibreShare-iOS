//
//  Message.swift
//  LibreShare
//
//  Created by roger deutsch on 3/10/19.
//  Copyright © 2019 Roger Deutsch. All rights reserved.
//

import Foundation

class Message :  NSObject {
    
    var note : String
    var _id : NSNumber
    var isComplete : Bool
    
    init(id : NSNumber, note : String, isComplete : Bool ){
        self._id =  id
        self.note = note
        self.isComplete = isComplete
    }
    
    init(snapshot: [String:AnyObject]) {
        self._id = 0
        self.note = ""
        self.isComplete = false;
        for item in snapshot{
            switch item.key.uppercased(){
            case ("_ID"):
                self._id = item.value as! NSNumber
            case ("NOTE"):
                self.note = item.value as! String
            case ("ISCOMPLETE"):
                self.isComplete = item.value as! Bool
            default:
                print("done")
            }
        }
        
    }
    
    
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
