//
//  PostMessageViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class PostMessageViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "PostMessageViewController"
        //self.setNavigationBarItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool)
    {
//        setupAppHeaderView()
    }

    @IBAction func NotNowClick(sender: AnyObject)
    {
        let vc:ParentDashBoardViewController = Globalstory.instantiateViewControllerWithIdentifier("ParentDashBoardViewController") as! ParentDashBoardViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func YesClicked(sender: AnyObject)
    {
        
    }
}
