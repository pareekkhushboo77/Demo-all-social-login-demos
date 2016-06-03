//
//  WelcomeViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/5/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "WelcomeViewController"
    }

    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func setupProfile(sender: AnyObject)
    {
        if(userType == "Parent")
        {
            let navigationController = Globalstory.instantiateViewControllerWithIdentifier("SecondNavigation") as! UINavigationController
            
            navigationController.navigationBarHidden = true
            let leftViewController = Globalstory.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
            navigationController.setViewControllers([leftViewController], animated: true)
            let leftSideMenuViewController = Globalstory.instantiateViewControllerWithIdentifier("leftSideMenuViewController")
            //
            
            let container:MFSideMenuContainerViewController = MFSideMenuContainerViewController.containerWithCenterViewController(navigationController, leftMenuViewController: leftSideMenuViewController, rightMenuViewController: nil)
            
            self.presentViewController(container, animated: true, completion: nil)

        }
        else
        {
            let navigationController = Globalstory.instantiateViewControllerWithIdentifier("SecondNavigation") as! UINavigationController
            navigationController.navigationBarHidden = true
            let leftViewController = Globalstory.instantiateViewControllerWithIdentifier("SitterProfileViewController") as! SitterProfileViewController
            navigationController.setViewControllers([leftViewController], animated: true)
            let leftSideMenuViewController = Globalstory.instantiateViewControllerWithIdentifier("leftSideMenuViewController")
            //
            
            let container:MFSideMenuContainerViewController = MFSideMenuContainerViewController.containerWithCenterViewController(navigationController, leftMenuViewController: leftSideMenuViewController, rightMenuViewController: nil)
            
            self.presentViewController(container, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func skipClicked(sender: AnyObject)
    {
        isFromMenu = true
        if(userType == "Parent")
        {
            let navigationController = Globalstory.instantiateViewControllerWithIdentifier("SecondNavigation") as! UINavigationController
            navigationController.navigationBarHidden = true
            let leftViewController = Globalstory.instantiateViewControllerWithIdentifier("ParentDashBoardViewController") as! ParentDashBoardViewController
            navigationController.setViewControllers([leftViewController], animated: true)
            let leftSideMenuViewController = Globalstory.instantiateViewControllerWithIdentifier("leftSideMenuViewController")
            //
            
            let container:MFSideMenuContainerViewController = MFSideMenuContainerViewController.containerWithCenterViewController(navigationController, leftMenuViewController: leftSideMenuViewController, rightMenuViewController: nil)
            
            self.presentViewController(container, animated: true, completion: nil)
        }
        else
        {
            let navigationController = Globalstory.instantiateViewControllerWithIdentifier("SecondNavigation") as! UINavigationController
            navigationController.navigationBarHidden = true
            let leftViewController = Globalstory.instantiateViewControllerWithIdentifier("SitterDashBoardViewController") as! SitterDashBoardViewController
            navigationController.setViewControllers([leftViewController], animated: true)
            let leftSideMenuViewController = Globalstory.instantiateViewControllerWithIdentifier("leftSideMenuViewController")
            //
            
            let container:MFSideMenuContainerViewController = MFSideMenuContainerViewController.containerWithCenterViewController(navigationController, leftMenuViewController: leftSideMenuViewController, rightMenuViewController: nil)
            
            self.presentViewController(container, animated: true, completion: nil)
        }
    }
}
