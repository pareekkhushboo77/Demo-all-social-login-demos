//
//  RatingIndexViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala56 on 15/04/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class RatingIndexViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentController = "RatingIndexViewController"
        //self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func Back_Button(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellRating")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
        
        
    }
}
