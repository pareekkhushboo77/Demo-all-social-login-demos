//
//  BookingViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/11/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit


class BookingViewController: UIViewController
{
    @IBOutlet weak var backAction: UIButton!
    @IBOutlet weak var tableviewprevious: UITableView!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "BookingViewController"
        
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
    }

    override func didReceiveMemoryWarning()
    {
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
    @IBAction func BackButton(sender: AnyObject)
    {
    
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellBookings")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    
    @IBAction func changeClick(sender: AnyObject)
    {
        if(userType == "Parent")
        {
            let vc:NewPostViewController = Globalstory.instantiateViewControllerWithIdentifier("NewPostViewController") as! NewPostViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func cancelClick(sender: AnyObject)
    {
        let vc:CancelBooking = Globalstory.instantiateViewControllerWithIdentifier("CancelBooking") as! CancelBooking
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    

}
