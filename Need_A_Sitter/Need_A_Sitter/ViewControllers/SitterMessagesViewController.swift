//
//  ParentMessagesViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala63 on 4/12/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class SitterMessagesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var backAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentController = "SitterMessagesViewController"
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
    
    
    @IBAction func Back_Button(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellparentmessage")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }

   
}
