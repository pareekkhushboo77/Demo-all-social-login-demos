//
//  ProfileViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{

    @IBOutlet weak var DescriptionTextView: UITextView!
    @IBOutlet weak var AddImageView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var smokingbtn: UIButton!
    @IBOutlet weak var nonsmokingbtn: UIButton!
    @IBOutlet weak var prefernottosaybtn: UIButton!
    
    
    
    
    let interests = ["Walking","Sports","Travel","Board Games","Video Games","Arts/Crafts","Music","Computers","Exercising","Shopping","Reading/Writing","Pets"]
    
    let interestsImages = ["Walking","Sports","Travel","BoardGames","VideoGames","ArtsCrafts","Music","Computers","Excercising", "Shopping","ReadingWriting","Pets"]
    
    let smokingImages = ["Smoking","Non-Smoking","PreferNotToSay"]
    
    let languages = ["English","French","Spanish","Italian","Dutch","Portuguese","Arabic","Russian","Mandarin"]
    let smoking = ["Smoking","Non-Smoking","Prefer Not To Say"]
    
    var languagesSelectArray = NSMutableArray()
    var interestSelectArray = NSMutableArray()
    var smokingSelect = ""
    
    @IBOutlet weak var backAction: UIButton!
    @IBOutlet weak var imageViewNAS: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "ProfileViewController"
        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollView.subviews
        {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height+=80
        self.scrollView.contentSize = contentRect.size
        
        AddImageView.layer.borderColor = AppGreenColor.CGColor
        AddImageView.layer.borderWidth = 2
        AddImageView.layer.masksToBounds = true
        AddImageView.layer.cornerRadius = 5
        
        DescriptionTextView.layer.borderColor = AppGreenColor.CGColor
        DescriptionTextView.layer.borderWidth = 2
        DescriptionTextView.layer.masksToBounds = true
        DescriptionTextView.layer.cornerRadius = 5
        
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
    
    
    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func submitClick(sender: AnyObject)
    {
        let vc:ProfileThanksViewController = Globalstory.instantiateViewControllerWithIdentifier("ProfileThanksViewController") as! ProfileThanksViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func LanguagesSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(languagesSelectArray.containsObject(sender.tag))
        {
            //remove from aarray
            //back to grey color
            languagesSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(languages[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            languagesSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(languages[sender.tag-1]).png"), forState: .Normal)
        }
    }
    
    @IBAction func InterestsSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(interestSelectArray.containsObject(sender.tag))
        {
            //remove from aarray
            //back to grey color
            interestSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(interestsImages[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            interestSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(interestsImages[sender.tag-1]).png"), forState: .Normal)
        }
    }
    
    @IBAction func SmokingSelect(sender: AnyObject)
    {
        if(sender.tag == 1)
        {
            smokingbtn.setImage(UIImage(named: "S\(smokingImages[0]).png"), forState: .Normal)
            nonsmokingbtn.setImage(UIImage(named: "\(smokingImages[1]).png"), forState: .Normal)
            prefernottosaybtn.setImage(UIImage(named: "\(smokingImages[2]).png"), forState: .Normal)
        }
        else if(sender.tag == 2)
        {
            smokingbtn.setImage(UIImage(named: "\(smokingImages[0]).png"), forState: .Normal)
            nonsmokingbtn.setImage(UIImage(named: "S\(smokingImages[1]).png"), forState: .Normal)
            prefernottosaybtn.setImage(UIImage(named: "\(smokingImages[2]).png"), forState: .Normal)
        }
        else
        {
            smokingbtn.setImage(UIImage(named: "\(smokingImages[0]).png"), forState: .Normal)
            nonsmokingbtn.setImage(UIImage(named: "\(smokingImages[1]).png"), forState: .Normal)
            prefernottosaybtn.setImage(UIImage(named: "S\(smokingImages[2]).png"), forState: .Normal)
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
