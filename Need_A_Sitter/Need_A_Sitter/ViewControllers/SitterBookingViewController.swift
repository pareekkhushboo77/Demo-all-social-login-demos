//
//  ParentBookingViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala63 on 4/12/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

var isPrevious = false

class SitterBookingViewController: UIViewController
{

    @IBOutlet weak var backAction: UIButton!
    @IBOutlet weak var tableviewprevious: UITableView!
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        currentController = "SitterBookingViewController"
       // self.setNavigationBarItem()
        
        if(isPrevious)
        {
            tableviewprevious.hidden = false
            tableview.hidden = true
        }
        else
        {
            tableviewprevious.hidden = true
            tableview.hidden = false
        }
    }
    
   
    override func viewWillAppear(animated: Bool)
    {
        if(isFromMenu)
        {
            self.backAction.hidden = true
        }
        else
        {
            self.backAction.hidden = false
        }
        
        if(isPrevious)
        {
            tableviewprevious.hidden = false
            tableview.hidden = true
        }
        else
        {
            tableviewprevious.hidden = true
            tableview.hidden = false
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    
    }
    
    @IBAction func previousBtn(sender: AnyObject)
    {
        tableviewprevious.hidden = false
        tableview.hidden = true
    }
    
    @IBAction func currentbtn(sender: AnyObject)
    {
        tableviewprevious.hidden = true
        tableview.hidden = false
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cellparentbooking")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    

}
