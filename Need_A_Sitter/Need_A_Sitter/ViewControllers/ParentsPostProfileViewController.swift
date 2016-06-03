//
//  ParentsPostProfileViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala63 on 4/13/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class ParentsPostProfileViewController: UIViewController,UICollectionViewDataSource
{
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var imageViewNAS: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        currentController = "ParentsPostProfileViewController"
        //self.setNavigationBarItem()
        //self.navigationController!.interactivePopGestureRecognizer!.enabled = false
        
        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollview.subviews
        {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height+=80
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
    
    @IBOutlet weak var HasHired: UICollectionView!
    
    //Collection View Delegates
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell = UICollectionViewCell()

        cell = HasHired.dequeueReusableCellWithReuseIdentifier("Hired", forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }
    
    
    //Review
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellreview")! as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    
}


