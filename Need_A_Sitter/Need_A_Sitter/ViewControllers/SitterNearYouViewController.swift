//
//  ParentsNearYouViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala63 on 4/12/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class SitterNearYouViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        currentController = "SitterNearYouViewController"
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cellParentnearyou")! as UITableViewCell
        
         (cell.viewWithTag(4)! as UIView).transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4))
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }


}
