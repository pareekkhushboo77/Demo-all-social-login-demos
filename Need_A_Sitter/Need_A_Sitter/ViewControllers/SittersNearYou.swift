//
//  SittersNearYou.swift
//  Need_A_Sitter
//
//  Created by Ratnakala33 on 4/12/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class SittersNearYou: UIViewController,UITableViewDataSource,UITableViewDelegate

{
    @IBOutlet weak var backAction: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "SittersNearYou"
        
        //self.setNavigationBarItem()
    }
    
    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
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
    
    @IBAction func sitterdetail(sender: AnyObject)
    {
        let vc:Sitterprofileview = Globalstory.instantiateViewControllerWithIdentifier("Sitterprofileview") as! Sitterprofileview
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("sitternearyou")! as UITableViewCell
        (cell.viewWithTag(4) as! UILabel).transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4))
        return cell
    }


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning() 
    }

}
