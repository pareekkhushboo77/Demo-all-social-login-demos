//
//  PostViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class PostViewController: UIViewController
{

    @IBOutlet weak var imageViewNAS: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "PostViewController"
        
//        self.setNavigationBarItem()
        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollView.subviews
        {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height+=80
        self.scrollView.contentSize = contentRect.size

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
    
    override func viewWillAppear(animated: Bool)
    {
//        setupAppHeaderView()
    }
    
    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func postClicked(sender: AnyObject)
    {
        let vc:PostMessageViewController = Globalstory.instantiateViewControllerWithIdentifier("PostMessageViewController") as! PostMessageViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

  
}
