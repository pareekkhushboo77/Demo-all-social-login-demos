//
//  FavouritesViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/8/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController,UITableViewDataSource
{

    @IBOutlet weak var backAction: UIButton!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "FavouritesViewController"
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
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(sender: AnyObject)
    {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
        //self.navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellFavourites")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }


}
