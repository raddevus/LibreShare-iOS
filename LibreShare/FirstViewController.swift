//
//  FirstViewController.swift
//  LibreShare
//
//  Created by roger deutsch on 3/8/19.
//  Copyright © 2019 Roger Deutsch. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class FirstViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mainLabel : UILabel!
    var ref : DatabaseReference!
    var postRef : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        postRef  = Database.database().reference()
    }

    @IBAction func getEntries_click(_ sender : UIButton){
        //FirebaseApp.initialize()
        //ref.  child("AB8763B964DD92B42F4566BE1445E20E8088EF4A").child("52223097E36341DEE340D7D49AF7ED257C13687A")
        
        let date = Date()
        let dateFormatter : DateFormatter = DateFormatter()
       
        dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        
        //ref.child("message").setValue("from Apple! - " + dateString)
        titleLabel.text = dateString
        var m : Message = Message()
        m.note = "updated : " + dateString
        postRef.child("test").setValue(m.toAnyObject(),withCompletionBlock: {
            (error: Error?, databaseReference: DatabaseReference) in
            print("Error while setting value \(error)")
        })
    //postRef.child("AB8763B964DD92B42F4566BE1445E20E8088EF4A").child("52223097E36341DEE340D7D49AF7ED257C13687A")
        postRef.child("Message")
        var refHandle : UInt = postRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [Message]
            let x = postDict?.count
        })
        
    }

}

