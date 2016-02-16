//
//  SecondViewController.swift
//  TO DO List
//
//  Created by bavly morcos on 2/11/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {

    @IBOutlet var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        todolist.append(item.text!)
        item.text = ""
        NSUserDefaults.standardUserDefaults().setObject(todolist, forKey: "todolist")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //controlling keyboard 
    
    //close the keyboard if the user tapped outside the screen 
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    //close the keyboard from button on the keyboard 
    
    
    
    func textFieldShouldReturn (textField : UITextField ) -> Bool {
    
     
        item.resignFirstResponder()
        return true
        
    }
    

}

