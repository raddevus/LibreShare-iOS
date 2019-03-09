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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
    }

    @IBAction func getEntries_click(_ sender : UIButton){
        //FirebaseApp.initialize()
        //ref.child(
        
        titleLabel.text = "I have changed!"
    }

}

