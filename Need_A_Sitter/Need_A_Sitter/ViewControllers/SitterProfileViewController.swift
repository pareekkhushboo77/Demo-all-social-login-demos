//
//  SitterProfileViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class SitterProfileViewController: UIViewController
{
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var AddimageView: UIView!
    
    @IBOutlet weak var desc: UITextView!
    
    @IBOutlet weak var backAction: UIButton!
    @IBOutlet weak var smokingbtn: UIButton!
    
    @IBOutlet weak var nonsmokingbtn: UIButton!
    
    @IBOutlet weak var cashbtn: UIButton!
    
    @IBOutlet weak var nasbtn: UIButton!
    
    @IBOutlet weak var prefernottosaybtn: UIButton!
    
    let languages = ["English","French","Spanish","Italian","Dutch","Portuguese","Arabic","Russian","Mandarin"]
    
    let interestsImages = ["Walking","Sports","Travel","BoardGames","Excercising", "Shopping","ReadingWriting","Pets"]
    
    let skills = ["Homework","Yardwork","Cleaning","CookingBaking"]
    
    let smokingImages = ["Smoking","Non-Smoking","PreferNotToSay"]
    
    let education = ["Education","Diploma","Degree"]
    let smoking = ["Smoking","Non-Smoking","Prefer Not To Say"]
    let payment = ["Cash","NAS"]
    
    var smokingSelect = ""
    var paymentSelect = ""
    
    var languagesSelectArray = NSMutableArray()
    var interestSelectArray = NSMutableArray()
    var skillsSelectArray = NSMutableArray()
    var educationSelectArray = NSMutableArray()
    
    
    @IBOutlet weak var imageViewNAS: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        self.setNavigationBarItem()
        currentController = "SitterProfileViewController"

        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollView.subviews
        {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height+=70
        self.scrollView.contentSize = contentRect.size

        AddimageView.layer.borderColor = AppGreenColor.CGColor
        AddimageView.layer.borderWidth = 2
        AddimageView.layer.masksToBounds = true
        AddimageView.layer.cornerRadius = 5
        
        desc.layer.borderColor = AppGreenColor.CGColor
        desc.layer.borderWidth = 2
        desc.layer.masksToBounds = true
        desc.layer.cornerRadius = 5
        
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
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func MenuClick(sender: AnyObject)
    {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    
    
    @IBAction func certificatesClick(sender: AnyObject)
    {
        let vc:CertificateViewController = Globalstory.instantiateViewControllerWithIdentifier("CertificateViewController") as! CertificateViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
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
    
    @IBAction func SkillsSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(skillsSelectArray.containsObject(sender.tag))
        {
            //remove from aarray
            //back to grey color
            skillsSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(skills[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            skillsSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(skills[sender.tag-1]).png"), forState: .Normal)
        }
    }
    
    @IBAction func EducationSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(educationSelectArray.containsObject(sender.tag))
        {
            //remove from aarray
            //back to grey color
            educationSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(education[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            educationSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(education[sender.tag-1]).png"), forState: .Normal)
        }
    }

    
    @IBAction func submitProfile(sender: AnyObject)
    {
        let vc:SitterDashBoardViewController = Globalstory.instantiateViewControllerWithIdentifier("SitterDashBoardViewController") as! SitterDashBoardViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    @IBAction func PaymentSelect(sender: AnyObject)
    {
        if(sender.tag == 1)
        {
            cashbtn.setImage(UIImage(named: "S\(payment[0]).png"), forState: .Normal)
            nasbtn.setImage(UIImage(named: "\(payment[1]).png"), forState: .Normal)
        }
        else if(sender.tag == 2)
        {
            cashbtn.setImage(UIImage(named: "\(payment[0]).png"), forState: .Normal)
            nasbtn.setImage(UIImage(named: "S\(payment[1]).png"), forState: .Normal)
        }
    }
}
