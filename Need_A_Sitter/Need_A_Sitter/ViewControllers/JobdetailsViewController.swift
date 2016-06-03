//
//  JobdetailsViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala63 on 4/13/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class JobdetailsViewController: UIViewController
{
    
    @IBOutlet weak var imageViewNAS: UIImageView!
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        currentController = "JobdetailsViewController"
        //self.setNavigationBarItem()
        
        
        

        
        
        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollview.subviews
        {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height+=130
        self.scrollview.contentSize = contentRect.size
       let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        imageViewNAS.userInteractionEnabled = true
        imageViewNAS.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func imageTapped(img: AnyObject)
    {
        if(userType == "Parent")
        {
            let vc = Globalstory.instantiateViewControllerWithIdentifier("ParentDashBoardViewController") as! ParentDashBoardViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            let vc = Globalstory.instantiateViewControllerWithIdentifier("SitterDashBoardViewController") as! SitterDashBoardViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func MenuClick(sender: AnyObject)
    {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func Back_Button(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func Accept(sender:AnyObject)
    {
        let alertview = JSSAlertView().show(self, title: "Do you need this Job ,Contact [xyz]", color: UIColorFromHex(0xfde003, alpha: 1))
        alertview.setTextTheme(.Light)
    }
    
}
