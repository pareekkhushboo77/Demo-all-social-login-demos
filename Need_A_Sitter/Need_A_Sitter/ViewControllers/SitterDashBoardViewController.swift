//
//  SitterDashBoardViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/5/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class SitterDashBoardViewController: UIViewController,UICollectionViewDataSource
{
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var collectionAvailable: UICollectionView!
    @IBOutlet weak var collectionNearYou: UICollectionView!
    
    @IBOutlet weak var collectionDays: UICollectionView!
    @IBOutlet weak var collectionAsap: UICollectionView!
    
    @IBOutlet weak var collectionNewJobs: UICollectionView!
    
    
    @IBOutlet weak var viewAvaible: UIView!
    
    @IBOutlet weak var viewDetails: UIView!
    
    var availableClicked = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "SitterDashBoardViewController"
//        self.setNavigationBarItem()
//        self.navigationController!.interactivePopGestureRecognizer!.enabled = false
        
        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollView.subviews
        {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height+=130
        self.scrollView.contentSize = contentRect.size
        
        
    }
    
    @IBAction func MenuClick(sender: AnyObject)
    {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    @IBAction func AddClick(sender: AnyObject)
    {
        
    }
    
    
    
    
    
    
    override func viewWillAppear(animated: Bool)
    {
//        setupAppHeaderView()
    }
    
    @IBAction func seeAllNewJobs(sender: AnyObject)
    {
        isFromMenu = false
        let vc:NewJobsListViewController = Globalstory.instantiateViewControllerWithIdentifier("NewJobsListViewController") as! NewJobsListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func seeAllNearyou(sender: AnyObject)
    {
        isFromMenu = false
        let vc:SitterNearYouViewController = Globalstory.instantiateViewControllerWithIdentifier("SitterNearYouViewController") as! SitterNearYouViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func seeAllAsap(sender: AnyObject)
    {
        isFromMenu = false
        let vc:SitterNearYouViewController = Globalstory.instantiateViewControllerWithIdentifier("SitterNearYouViewController") as! SitterNearYouViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func Messages(sender: AnyObject)
    {
        isFromMenu = false
        let vc:SitterMessagesViewController = Globalstory.instantiateViewControllerWithIdentifier("SitterMessagesViewController") as! SitterMessagesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func Bookings(sender: AnyObject)
    {
        isFromMenu = false
        let vc:BookingViewController = Globalstory.instantiateViewControllerWithIdentifier("BookingViewController") as! BookingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Availability(sender: AnyObject)
    {
        if(availableClicked)
        {
            //open
            UIView.animateWithDuration(0.5, animations: { () -> Void in
//                self.viewAvaible.frame = CGRectMake(self.viewAvaible.frame.origin.x, self.viewAvaible.frame.origin.y-self.viewAvaible.frame.size.height, self.viewAvaible.frame.size.width, self.viewAvaible.frame.size.height)
//                
                self.viewDetails.frame = CGRectMake(self.viewDetails.frame.origin.x, self.viewDetails.frame.origin.y-self.viewAvaible.frame.size.height, self.viewDetails.frame.size.width, self.viewDetails.frame.size.height)
                }, completion: { (av) -> Void in
                    self.viewAvaible.hidden = true
                    self.scrollView.contentSize.height=self.viewDetails.frame.size.height+100
            })
        }
        else
        {
            //close
            viewAvaible.hidden = false
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.viewDetails.frame = CGRectMake(self.viewDetails.frame.origin.x, self.viewDetails.frame.origin.y+self.viewAvaible.frame.size.height, self.viewDetails.frame.size.width, self.viewDetails.frame.size.height)
                }, completion: { (av) -> Void in
                    self.scrollView.contentSize.height=self.viewDetails.frame.size.height+self.viewAvaible.frame.size.height+100
            })
        }
        availableClicked = !availableClicked
    }
    
    
    
    //Collection View Delegates
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if(collectionView == collectionNearYou)
        {
            
        }
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell = UICollectionViewCell()
        
        if(collectionView == collectionNearYou)
        {
            cell = collectionNearYou.dequeueReusableCellWithReuseIdentifier("cellNearYou", forIndexPath: indexPath) as UICollectionViewCell
            
            (cell.viewWithTag(4) as! UILabel).transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4))
        }
        else if(collectionView == collectionAsap)
        {
            cell = collectionAsap.dequeueReusableCellWithReuseIdentifier("cellAsap", forIndexPath: indexPath) as UICollectionViewCell
            
            (cell.viewWithTag(4) as! UILabel).transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4))
        }
        else if(collectionView == collectionNewJobs)
        {
            cell = collectionNewJobs.dequeueReusableCellWithReuseIdentifier("cellNewJobs", forIndexPath: indexPath) as UICollectionViewCell
            
            (cell.viewWithTag(4) as! UILabel).transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4))
        }
        else if(collectionView == collectionDays)
        {
            cell = collectionDays.dequeueReusableCellWithReuseIdentifier("cellDays", forIndexPath: indexPath) as UICollectionViewCell
            
        }
        else if(collectionView == collectionAvailable)
        {
            cell = collectionAvailable.dequeueReusableCellWithReuseIdentifier("cellAvailable", forIndexPath: indexPath) as UICollectionViewCell
            
        }
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 2
        cell.contentView.layer.borderColor = UIColor(red: 125/255, green: 199/255, blue: 109/255, alpha: 1).CGColor
        cell.contentView.layer.masksToBounds = true
        return cell
    }



}
