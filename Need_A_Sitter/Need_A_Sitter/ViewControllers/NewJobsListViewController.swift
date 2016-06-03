//
//  NewJobsListViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class NewJobsListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    @IBOutlet weak var backAction: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "NewJobsListViewController"
        //self.setNavigationBarItem()
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cellNewJobsList")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    
    @IBAction func viewProfileClick(sender: AnyObject)
    {
        let vc:ParentsPostProfileViewController = Globalstory.instantiateViewControllerWithIdentifier("ParentsPostProfileViewController") as! ParentsPostProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func JobDetailsClick(sender: AnyObject)
    {
        let vc:JobdetailsViewController = Globalstory.instantiateViewControllerWithIdentifier("JobdetailsViewController") as! JobdetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func parentsClick(sender: AnyObject)
    {
        let vc:MessagesViewController = Globalstory.instantiateViewControllerWithIdentifier("MessagesViewController") as! MessagesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
