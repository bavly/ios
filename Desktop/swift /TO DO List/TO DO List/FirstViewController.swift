//
//  FirstViewController.swift
//  TO DO List
//
//  Created by bavly morcos on 2/11/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit

var todolist = [String]()

class FirstViewController: UIViewController , UITableViewDelegate{

    @IBOutlet var toDoListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //permenant storage after closing app to store the list
        
        // to check if todolist is exist or not ?
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("todolist") != nil)
        
        {
            todolist = NSUserDefaults.standardUserDefaults().objectForKey("todolist") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return todolist.count
        
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
     {
      
        let cell = UITableViewCell(style: UITableViewCellStyle.Default , reuseIdentifier: "Cell")
        cell.textLabel?.text = todolist[indexPath.row]
        return cell
        
    }
    
    // if the user check swap to the left the item should be deleted 
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            todolist.removeAtIndex(indexPath.row)
            
        }
        NSUserDefaults.standardUserDefaults().setObject(todolist, forKey: "todolist")
        
        // update table 
        toDoListTable.reloadData()
        
        
    }
    

    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        
    }

}

