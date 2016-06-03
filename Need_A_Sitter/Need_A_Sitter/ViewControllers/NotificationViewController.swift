//
//  NotificationViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/12/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var backAction: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "NotificationViewController"
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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
    

    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellNotifications")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }


}
