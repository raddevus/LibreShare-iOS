//
//  Message.swift
//  LibreShare
//
//  Created by roger deutsch on 3/10/19.
//  Copyright © 2019 Roger Deutsch. All rights reserved.
//

import Foundation

class Message :  Hashable{
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs == rhs
    }
    
    init(id : NSNumber, note : String ){
        self._id =  id
        self.note = note
    }
    var note : String
    var _id : NSNumber
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
