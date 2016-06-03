//
//  Sitterprofileview.swift
//  Need_A_Sitter
//
//  Created by Ratnakala56 on 15/04/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class Sitterprofileview: UIViewController
{

    @IBOutlet weak var backAction: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var imageViewNAS: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "Sitterprofileview"
        //self.setNavigationBarItem()
        //self.navigationController?.interactivePopGestureRecognizer!.enabled = false
        
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
    
    
    
       
    @IBAction func backbutton(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func Index(sender: AnyObject)
    {
        let vc:RatingIndexViewController = Globalstory.instantiateViewControllerWithIdentifier("RatingIndexViewController") as! RatingIndexViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var HasWorkedFor: UICollectionView!
    
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
        
        cell = HasWorkedFor.dequeueReusableCellWithReuseIdentifier("HasWorkedFor", forIndexPath: indexPath) as UICollectionViewCell
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
