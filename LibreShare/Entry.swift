//
//  Entry.swift
//  LibreShare
//
//  Created by roger deutsch on 3/9/19.
//  Copyright © 2019 Roger Deutsch. All rights reserved.
//

import Foundation
class Entry {
 
    var _id : String;
    var title : String;
    var created : String;
    var updated : String;
    var allMessages : [String: NSDictionary]
    
    init(){
  
        _id = "";
        title = "";
        created = "";
        updated = "";
        allMessages = [:]
    }
    
    init(id:String, title:String,created:String, updated:String, messages : [String:NSDictionary]){
        _id = id;
        self.title = title
        self.created = created
        self.updated = updated
        allMessages = messages
    }
    
    func get_id() -> String {
        return _id;
    }
    
    /*List<Message> get_allMessages() {
        return _allMessages;
    }
     List<Message> _allMessages;*/
     // #1
}
