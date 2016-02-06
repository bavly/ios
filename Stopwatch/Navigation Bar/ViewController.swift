//
//  ViewController.swift
//  Navigation Bar
//
//  Created by Rob Percival on 16/06/2015.
//  Copyright © 2015 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var timerlabel: UILabel!
    
    var timer = NSTimer ()
    
    var time = 0
    
    func result ()
    {
        time++
        
        timerlabel.text = (String) (time)
    }

    
    @IBAction func play(sender: AnyObject) {
    
               timer = NSTimer.scheduledTimerWithTimeInterval( 1, target: self, selector: Selector ("result"), userInfo: nil , repeats: true)
    }
    
    
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        
    }
    
    
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        time = 0
        timerlabel.text = "0"
    }
    
    
    
    override func viewDidLoad() {
        
                super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

