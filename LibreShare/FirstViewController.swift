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
        var allMessages : [Message]=[]
        dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        
        //ref.child("message").setValue("from Apple! - " + dateString)
        titleLabel.text = dateString
        var m : Message = Message()
        m.note = "updated : " + dateString
        postRef.child("test").child("x553").setValue(m.toAnyObject(),withCompletionBlock: {
            (error: Error?, databaseReference: DatabaseReference) in
            print("Error while setting value \(error)")
        })
    //.child("AB8763B964DD92B42F4566BE1445E20E8088EF4A").child("52223097E36341DEE340D7D49AF7ED257C13687A")
        //.child("test")
        var refHandle : UInt = postRef.child("test").observe(DataEventType.value, with: { (snapshot) in
            var postDict = snapshot.value as! [String : NSDictionary]
           
            for s : String in postDict.keys{
                print ("KEYS -> \(s)")
            }
            for v : AnyObject in postDict.values{
                print ("Values -> \(v)")

            }
            postDict = snapshot.value as! [String : NSDictionary]
            for item : (String,NSDictionary) in postDict{
                print ("ITEMS -> \(item)")
                var m = Message()
                //allMessages.append(Message(id: item.1 as String, note: item.1))
                switch item.0.uppercased(){
                case ("_ID"):
                    m._id = item.1 as! NSNumber
                case ("NOTE"):
                    m.note = item.1 as! String
                default:
                    print("got nothing : " + item.0.uppercased())
                }
                print ("item.0 \(item.0)")
                print ("item.1 \(item.1)")
                //print (item.String)
                //print (item.AnyObject)
            }
            for msg in allMessages{
                print ("ID : \(msg._id) Note : \(msg.note)"  )
            }
//            for v : AnyObject in postDict.values{
//                print ("Values -> \(v)")
//            }
            //let x :AnyObject = postDict.values as AnyObject
            let x = 6;
        })
        
    }

}

