//
//  SecondViewController.swift
//  LibreShare
//
//  Created by roger deutsch on 3/8/19.
//  Copyright © 2019 Roger Deutsch. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class SecondViewController: UIViewController {

    var postRef : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        postRef  = Database.database().reference()
    }

    @IBAction func loadMessage(_ sender : UIButton){
   
       //child("AB8763B964DD92B42F4566BE1445E20E8088EF4A").child("52223097E36341DEE340D7D49AF7ED257C13687A")
    postRef.child("test").child("x553").observeSingleEvent(of: .value, with: { (snapshot)   in
            for item in snapshot.children{
                var msg = Message(snapshot:item as! DataSnapshot)
            }
        })
        { (error) in
            print(error.localizedDescription)
        }
    }

}

