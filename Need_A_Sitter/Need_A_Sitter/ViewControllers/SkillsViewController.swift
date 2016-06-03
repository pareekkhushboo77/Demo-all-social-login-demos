//
//  SkillsViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/12/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController
{
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    let skills = ["Homework","Yardwork","Cleaning","Cooking/Baking","Music","Computers","Good Driver","Mechanically Inclined","Reliable","Laundry","Groom","Punctual","Organised","Self Starter","Pickup/Dropoff","Languages","First-Aid","CPR","Reading/Writing","Arts/Crafts"]
    
    let skillsImages = ["Homework","Yardwork","Cleaning","CookingBaking","Music","Computers","GoodDriver","MechanicallyInclined","Reliable","Laundry","Groom","Punctual","Oraganized","SelfStarter","PickupDropoff","Languages","First-Aid","CPR","ReadingWriting","ArtsCrafts"]
    
    
    var skillsSelectArray = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "SkillsViewController"
       // self.setNavigationBarItem()
        
        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollView.subviews
        {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height+=60
        self.scrollView.contentSize = contentRect.size
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @IBAction func SkillsSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(skillsSelectArray.containsObject(sender.tag))
        {
            //remove from aarray
            //back to grey color
            skillsSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(skillsImages[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            skillsSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(skillsImages[sender.tag-1]).png"), forState: .Normal)
        }
        
        
        
    }
    
    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func Submit(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
