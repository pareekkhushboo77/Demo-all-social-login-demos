//
//  ParentDashBoardViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/5/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class ParentDashBoardViewController: UIViewController,UICollectionViewDataSource
{

    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var slideDownCategory: UIView!
    
    @IBOutlet weak var slideDownSearchByView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var collectionNearYou: UICollectionView!
    
    @IBOutlet weak var collectionByTime: UICollectionView!
    
    @IBOutlet weak var collectionAvailableNow: UICollectionView!
    
    var plusClicked = false
    var bookingsClicked = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "ParentDashBoardViewController"
//        self.setNavigationBarItem()
//        
//        let righ = UIImage(named: "plus.png")
//        let rightButton: UIBarButtonItem = UIBarButtonItem(image: righ, style: UIBarButtonItemStyle.Plain, target: self, action: "PlusButtonParentDashBoard")
//        navigationItem.rightBarButtonItem = rightButton;
        
        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollView.subviews
        {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height+=150
        self.scrollView.contentSize = contentRect.size
    }
    
    @IBAction func plusClick(sender: AnyObject)
    {
        if(plusClicked)
        {
            if(bookingsClicked)
            {
                SlideDownBookingsBtn([])
            }
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.slideDownSearchByView.frame = CGRectMake(self.slideDownSearchByView.frame.origin.x, self.slideDownSearchByView.frame.origin.y-self.slideDownSearchByView.frame.size.height, self.slideDownSearchByView.frame.size.width, self.slideDownSearchByView.frame.size.height)
                }, completion: nil)
        }
        else
        {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.slideDownSearchByView.frame = CGRectMake(self.slideDownSearchByView.frame.origin.x, self.slideDownSearchByView.frame.origin.y+self.slideDownSearchByView.frame.size.height, self.slideDownSearchByView.frame.size.width, self.slideDownSearchByView.frame.size.height)
                
                
                }, completion: nil)
        }
        plusClicked = !plusClicked
    }
    
    @IBAction func MenuClick(sender: AnyObject)
    {
       self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        
    }

    
    @IBAction func CategoryClick(sender: AnyObject)
    {
        bookingsClicked=false
        SlideDownBookingsBtn([])
    }
    
    @IBAction func SkillsClick(sender: AnyObject)
    {
        isFromMenu = false
        let vc:SkillsViewController = Globalstory.instantiateViewControllerWithIdentifier("SkillsViewController") as! SkillsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func SlideDownBookingsBtn(sender: AnyObject)
    {
        if(bookingsClicked)
        {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.slideDownCategory.frame = CGRectMake(self.slideDownCategory.frame.origin.x, self.slideDownCategory.frame.origin.y-self.slideDownCategory.frame.size.height, self.slideDownCategory.frame.size.width, self.slideDownCategory.frame.size.height)
                }, completion: nil)
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y-(self.slideDownCategory.frame.size.height-self.slideDownSearchByView.frame.size.height), self.contentView.frame.size.width, self.contentView.frame.size.height)
                self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y-(self.slideDownCategory.frame.size.height-self.slideDownSearchByView.frame.size.height), self.contentLabel.frame.size.width, self.contentLabel.frame.size.height)
                self.scrollView.frame = CGRectMake(self.scrollView.frame.origin.x, self.scrollView.frame.origin.y-(self.slideDownCategory.frame.size.height-self.slideDownSearchByView.frame.size.height), self.scrollView.frame.size.width, self.scrollView.frame.size.height)
            })
            
            
            scrollView.contentSize.height-=(self.slideDownCategory.frame.size.height-self.slideDownSearchByView.frame.size.height)
            
        }
        else
        {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.slideDownCategory.frame = CGRectMake(self.slideDownCategory.frame.origin.x, self.slideDownCategory.frame.origin.y+self.slideDownCategory.frame.size.height, self.slideDownCategory.frame.size.width, self.slideDownCategory.frame.size.height)
                
                }, completion: nil)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y+(self.slideDownCategory.frame.size.height-self.slideDownSearchByView.frame.size.height), self.contentView.frame.size.width, self.contentView.frame.size.height)
                self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y+(self.slideDownCategory.frame.size.height-self.slideDownSearchByView.frame.size.height), self.contentLabel.frame.size.width, self.contentLabel.frame.size.height)
                self.scrollView.frame = CGRectMake(self.scrollView.frame.origin.x, self.scrollView.frame.origin.y+(self.slideDownCategory.frame.size.height-self.slideDownSearchByView.frame.size.height), self.scrollView.frame.size.width, self.scrollView.frame.size.height)
            })
            
            scrollView.contentSize.height+=(self.slideDownCategory.frame.size.height-self.slideDownSearchByView.frame.size.height)
            
        }
        bookingsClicked = !bookingsClicked
    }
    
    @IBAction func LocationClick(sender: AnyObject)
    {
        
    }
    
    func PlusButtonParentDashBoard()
    {
        
    }
    
    @IBAction func BookingsClick(sender: AnyObject)
    {
        isFromMenu = false
        let vc:BookingViewController = Globalstory.instantiateViewControllerWithIdentifier("BookingViewController") as! BookingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func MessagesClicked(sender: AnyObject)
    {
        isFromMenu = false
        let vc:MessagesViewController = Globalstory.instantiateViewControllerWithIdentifier("MessagesViewController") as! MessagesViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func myPostsClicked(sender: AnyObject)
    {
        isFromMenu = false
        let vc:MyPostsViewController = Globalstory.instantiateViewControllerWithIdentifier("MyPostsViewController") as! MyPostsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func seeAllNearYou(sender: AnyObject)
    {
        isFromMenu = false
        let vc:SittersNearYou = Globalstory.instantiateViewControllerWithIdentifier("SittersNearYou") as! SittersNearYou
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func seeAllBookByTime(sender: AnyObject)
    {
        isFromMenu = false
        let vc:TimeListViewController = Globalstory.instantiateViewControllerWithIdentifier("TimeListViewController") as! TimeListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func seeAllAvailableNow(sender: AnyObject)
    {
        isFromMenu = false
        let vc:SittersNearYou = Globalstory.instantiateViewControllerWithIdentifier("SittersNearYou") as! SittersNearYou
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func postajobButton(sender: AnyObject)
    {
        isFromMenu = false
        let vc:NewPostViewController = Globalstory.instantiateViewControllerWithIdentifier("NewPostViewController") as! NewPostViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
        else if(collectionView == collectionByTime)
        {
            cell = collectionByTime.dequeueReusableCellWithReuseIdentifier("cellBookByTime", forIndexPath: indexPath) as UICollectionViewCell
            
            (cell.viewWithTag(1) as! UILabel).text = "3 Available"
            (cell.viewWithTag(1) as! UILabel).transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4))
            (cell.viewWithTag(2) as! UILabel).text = "3:15"
            (cell.viewWithTag(3) as! UILabel).text = "PM"
        }
        else if(collectionView == collectionAvailableNow)
        {
            cell = collectionAvailableNow.dequeueReusableCellWithReuseIdentifier("cellAvailableNow", forIndexPath: indexPath) as UICollectionViewCell
            
            (cell.viewWithTag(4) as! UILabel).transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4))
        }
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 2
        cell.contentView.layer.borderColor = UIColor(red: 125/255, green: 199/255, blue: 109/255, alpha: 1).CGColor
        cell.contentView.layer.masksToBounds = true
        return cell
    }
    
    

}
