//
//  ViewController.swift
//  GrandCentralDispatchProject
//
//  Created by Eva Marie Bresciano on 6/1/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
     loadStuff()
    let myQue = dispatch_queue_create("rahrahrahrahrah", nil)
        dispatch_async(myQue) { ()  -> Void in
            self.loadStuff()
        }
        
            
    }

    
    func loadStuff() {
        NSThread.sleepForTimeInterval(6)
        dispatch_async(dispatch_get_main_queue()) { ()  -> Void in 
        let randomNumber = Int(arc4random_uniform(UInt32(100)))
        self.myLabel.text = "\(randomNumber)"
        
        }
    }

}