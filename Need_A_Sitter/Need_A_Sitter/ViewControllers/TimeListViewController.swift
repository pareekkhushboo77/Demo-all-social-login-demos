//
//  TimeListViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class TimeListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "TimeListViewController"
        //self.setNavigationBarItem()

    }

    override func viewWillAppear(animated: Bool)
    {
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func BackAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellTime")! as UITableViewCell
        (cell.viewWithTag(1)! as UIView).layer.borderColor = UIColor(red: 125/255, green: 199/255, blue: 109/255, alpha: 1).CGColor
        (cell.viewWithTag(1)! as UIView).layer.borderWidth = 1
        (cell.viewWithTag(1)! as UIView).layer.masksToBounds = true
        
        (cell.viewWithTag(5)! as UIView).layer.cornerRadius = (cell.viewWithTag(5)! as UIView).layer.frame.size.width/2
        (cell.viewWithTag(5)! as UIView).layer.masksToBounds = true
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellTimeHeader")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64.0
    }
    

}
