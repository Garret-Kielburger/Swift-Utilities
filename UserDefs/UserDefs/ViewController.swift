//
//  ViewController.swift
//  UserDefs
//
//  Created by Garret Kielburger on 2021-09-30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let name = "name"
        let time = Date()
        
        UserDefs.saveName(name: name)
        UserDefs.saveTime(over: time)
        
        let whatsMyName = UserDefs.fetchName()
        let whatsThatTime = UserDefs.fetchTime()
        
        print(whatsMyName)
        print(whatsThatTime)
    }
}

