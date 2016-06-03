//
//  SideViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/21/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class SideViewController: UITableViewController {

    
    var sectionTitleArray : NSMutableArray = NSMutableArray()
    var sectionContentDict : NSMutableDictionary = NSMutableDictionary()
    var arrayForBool : NSMutableArray = NSMutableArray()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        arrayForBool = ["0","0","0","0","0","0"]
        sectionTitleArray = ["John Doe","Messages","Booking","Favourites","Contact","Notifications/Settings"]
        
        let profile : NSArray = ["Profile","Payment Details","Sign Out"]
        var string1 = sectionTitleArray.objectAtIndex(0) as? String
        sectionContentDict.setValue(profile, forKey:string1!)
        
        let Messages : NSArray = ["Go to Messages"]
        string1 = sectionTitleArray.objectAtIndex(1) as? String
        sectionContentDict.setValue(Messages, forKey:string1!)
        
        if(userType == "Parent")
        {
            let Booking : NSArray = ["Current","Previous","Posted Jobs"]
            string1 = sectionTitleArray.objectAtIndex(2) as? String
            sectionContentDict.setValue(Booking, forKey:string1!)
        }
        else
        {
            let Booking : NSArray = ["Current","Previous","My Jobs"]
            string1 = sectionTitleArray.objectAtIndex(2) as? String
            sectionContentDict.setValue(Booking, forKey:string1!)
        }
        
        let Favourites : NSArray = ["My Favorites"]
        string1 = sectionTitleArray.objectAtIndex(3) as? String
        sectionContentDict.setValue(Favourites, forKey:string1!)
        
        let Contact : NSArray = ["Message Us"]
        string1 = sectionTitleArray.objectAtIndex(4) as? String
        sectionContentDict.setValue(Contact, forKey:string1!)
        
        let notifications : NSArray = ["Notifications"]
        string1 = sectionTitleArray.objectAtIndex(5) as? String
        sectionContentDict.setValue(notifications, forKey:string1!)

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(arrayForBool .objectAtIndex(section).boolValue == true)
        {
            let tps = sectionTitleArray.objectAtIndex(section) as! String
            
            let count1 = (sectionContentDict.valueForKey(tps)) as! NSArray
            print("tps ---  \(tps)")
            print("count ---  \(count1.count)")
            return count1.count
        }
        return 0;
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        headerView.backgroundColor = UIColor(red: 125/255, green: 199/255, blue: 109/255, alpha: 1)
        
        
        let collapsed = arrayForBool.objectAtIndex(section).boolValue
        
        print("======= \(collapsed)")
        let headerString = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width-10, height: 30)) as UILabel
        
        let btnHeader = UIButton(type: UIButtonType.System) as UIButton
        btnHeader.frame = CGRectMake(tableView.frame.size.width-50, 20, 25, 14)
        if(collapsed == true)
        {
            btnHeader.setBackgroundImage(UIImage(named: "collapseUp.png"), forState: .Normal)
        }
        else
        {
            btnHeader.setBackgroundImage(UIImage(named: "collapseDown.png"), forState: .Normal)
        }
        headerString.text = sectionTitleArray.objectAtIndex(section) as? String
        headerString.textColor = UIColor.whiteColor()
        headerView .addSubview(headerString)
        headerView .addSubview(btnHeader)
        
        //        let headerView:SectionTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell1") as! SectionTableViewCell
        //        headerView.sectionlabeltext.text = sectionTitleArray.objectAtIndex(section) as? String
        
        headerView.tag = section
        let headerTapped = UITapGestureRecognizer (target: self, action:"sectionHeaderTapped:")
        headerView .addGestureRecognizer(headerTapped)
        
        return headerView
    }
    
    func sectionHeaderTapped(recognizer: UITapGestureRecognizer) {
        print("Tapping working")
        print(recognizer.view?.tag)
        
        let indexPath : NSIndexPath = NSIndexPath(forRow: 0, inSection:(recognizer.view?.tag as Int!)!)
        if (indexPath.row == 0)
        {
            /*for(var i=0;i<self.tableView.numberOfSections;i++)
            {
            arrayForBool.replaceObjectAtIndex(i, withObject: false)
            }*/
            
            var collapsed = arrayForBool.objectAtIndex(indexPath.section).boolValue
            collapsed = !collapsed;
            arrayForBool.replaceObjectAtIndex(indexPath.section, withObject: collapsed)
            
            //reload specific section animated
            let range = NSMakeRange(indexPath.section, 1)
            
            //reload all sections
            //            let range = NSMakeRange(0, self.tableView.numberOfSections)
            
            
//            self.tableView.reloadData()
            let sectionToReload = NSIndexSet(indexesInRange: range)
            
            self.tableView.reloadSections(sectionToReload, withRowAnimation:UITableViewRowAnimation.Automatic)
        }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //        let cell:cellTableViewCell = tbl1.dequeueReusableCellWithIdentifier("cell123", forIndexPath: indexPath) as! cellTableViewCell
        
        let cell:LeftTableViewCell = tableView.dequeueReusableCellWithIdentifier("LeftReuse") as! LeftTableViewCell
        
        let manyCells : Bool = arrayForBool.objectAtIndex(indexPath.section).boolValue
        
        if (!manyCells)
        {
            //  cell.textLabel.text = @"click to enlarge";
        }
        else
        {
            let content = sectionContentDict.valueForKey(sectionTitleArray.objectAtIndex(indexPath.section) as! String) as! NSArray
            cell.label_text.text = content.objectAtIndex(indexPath.row) as? String
            //cell.cellImage.image = UIImage(named: "forward.png")
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print("Selected Index : \(indexPath.row)")
        
        let keys = sectionTitleArray.objectAtIndex(indexPath.section)
        let cellsection = sectionContentDict.objectForKey(keys) as! NSArray
        let cellElement:String = cellsection.objectAtIndex(indexPath.row) as! String
        
        print("==== = =  = = = == \(cellElement)")
       
        /*DemoViewController *demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DemoViewController"];
        demoViewController.title = [NSString stringWithFormat:@"Demo #%d-%d", indexPath.section, indexPath.row];
        
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:demoViewController];
        navigationController.viewControllers = controllers;*/
        //[self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
        
        
        switch cellElement
        {
        case "Profile":
            isFromMenu = true
            if(userType == "Parent")
            {
                let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
                let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
                nc.setViewControllers([profileviewcontrollerr], animated: true)
                self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
            }
            else
            {
                let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("SitterProfileViewController") as! SitterProfileViewController
                let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
                nc.setViewControllers([profileviewcontrollerr], animated: true)
                self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
                
            }
            
        case "Payment Details":
            isFromMenu = true
            print("PAYMENT DETAILS")
            
        case "Sign Out":
            isFromMenu = true
            print("SIGN OUT")
            let navigationController1 = Globalstory.instantiateViewControllerWithIdentifier("MainNavigationView") as! UINavigationController
            self.presentViewController(navigationController1, animated: true, completion: nil)
            
        case "Go to Messages":
            isFromMenu = true
            print("MESSAGES")
            
            let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("MessagesViewController") as! MessagesViewController
            let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
            nc.setViewControllers([profileviewcontrollerr], animated: true)
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
            
        case "Current":
            isFromMenu = true
            print("CURRENT")
            isPrevious = false
            let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("BookingViewController") as! BookingViewController
            let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
            nc.setViewControllers([profileviewcontrollerr], animated: true)
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
            
            
        case "Previous":
            isFromMenu = true
            isPrevious = true
            let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("BookingViewController") as! BookingViewController
            let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
            nc.setViewControllers([profileviewcontrollerr], animated: true)
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
            
        case "Posted Jobs":
            isFromMenu = true
            print("POSTED JOBS")
            
            let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("MyPostsViewController") as! MyPostsViewController
            let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
            nc.setViewControllers([profileviewcontrollerr], animated: true)
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
            
        case "My Jobs":
            isFromMenu = true
            print("My Jobs")
            let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("NewJobsListViewController") as! NewJobsListViewController
            let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
            nc.setViewControllers([profileviewcontrollerr], animated: true)
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
            
            
            
        case "My Favorites":
            isFromMenu = true
            print("FAVO")
            let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("FavouritesViewController") as! FavouritesViewController
            let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
            nc.setViewControllers([profileviewcontrollerr], animated: true)
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
            
        case "Message Us":
            isFromMenu = true
            print("MESSAGE US")
            
        case "Notifications":
            isFromMenu = true
            print("NOTIFICATIONS")
            let profileviewcontrollerr = Globalstory.instantiateViewControllerWithIdentifier("NotificationViewController") as! NotificationViewController
            let nc:UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController
            nc.setViewControllers([profileviewcontrollerr], animated: true)
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
            
        default:
            print("DEFAULT")
        }
    }
    

}
