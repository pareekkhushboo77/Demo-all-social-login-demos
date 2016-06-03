//
//  NewPostViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController
{
    
    @IBOutlet weak var houseSitting: UIButton!
    @IBOutlet weak var petsCare: UIButton!
    @IBOutlet weak var seniorCare: UIButton!
    @IBOutlet weak var childCare: UIButton!
    @IBOutlet weak var typeofcareView: UIView!
    @IBOutlet weak var optionPets: UIView!
    @IBOutlet weak var optionviewChildren: UIView!
    @IBOutlet weak var optionviewSenior: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var commonContentView: UIView!
    var heightTillOptions:CGFloat = 312.0
    var fullheight:CGFloat = 0.0
    
    @IBOutlet weak var onetimeonly: UIButton!
    @IBOutlet weak var occasional: UIButton!
    @IBOutlet weak var parttime: UIButton!
    @IBOutlet weak var fulltime: UIButton!
    
    @IBOutlet weak var imageViewNAS: UIImageView!
    
    let seniorpreference = ["Transport","TransportSenior","Cleaning","RunningErands","Pets","Non-Smoking","Languages","CookingBaking","SpecialNeeds","CPR","First-Aid","BathingAssist"]
    
    let petpreference = ["Pets","PetWalking","Male","Female","BathingAssist","Vaccinations","Cleaning","Groom"]
    
    let childpreference = ["Transport","TransportSenior","Cleaning","RunningErands","Pets","Non-Smoking","Languages","CookingBaking","SpecialNeeds","CPR","First-Aid","BabysitterCourse"]
    
    let typeofcare = ["OneTimeOnly","Occasional","PartTime","FullTime"]
    
    let days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    
    var seniorpreferenceSelectArray = NSMutableArray()
    var daysSelectArray = NSMutableArray()
    var petspreferenceSelectArray = NSMutableArray()
    var childpreferenceSelectArray = NSMutableArray()
    var typeofcareSelect = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "NewPostViewController"
        self.scrollView.contentSize = CGSizeMake(self.scrollView.layer.frame.size.width, 520)
        
        childCareClick([])
        
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
    
    
    @IBAction func PreferenceSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(seniorpreferenceSelectArray.containsObject(sender.tag))
        {
            //remove from array
            //back to grey color
            seniorpreferenceSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(seniorpreference[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            seniorpreferenceSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(seniorpreference[sender.tag-1]).png"), forState: .Normal)
        }
    }
    
    @IBAction func ChildPreferenceSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(childpreferenceSelectArray.containsObject(sender.tag))
        {
            //remove from array
            //back to grey color
            childpreferenceSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(childpreference[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            childpreferenceSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(childpreference[sender.tag-1]).png"), forState: .Normal)
        }
    }
    
    @IBAction func PetPreferenceSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(petspreferenceSelectArray.containsObject(sender.tag))
        {
            //remove from array
            //back to grey color
            petspreferenceSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(petpreference[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            petspreferenceSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(petpreference[sender.tag-1]).png"), forState: .Normal)
        }
    }
    
    @IBAction func DaysSelect(sender: AnyObject)
    {
        let button:UIButton = sender as! UIButton
        if(daysSelectArray.containsObject(sender.tag))
        {
            //remove from array
            //back to grey color
            daysSelectArray.removeObject(sender.tag)
            button.setImage(UIImage(named: "\(days[sender.tag-1]).png"), forState: .Normal)
        }
        else
        {
            //add to array
            //green color
            daysSelectArray.addObject(sender.tag)
            button.setImage(UIImage(named: "S\(days[sender.tag-1]).png"), forState: .Normal)
        }
    }
    
    @IBAction func typeofcareSelect(sender: AnyObject)
    {
        if(sender.tag == 1)
        {
            onetimeonly.setImage(UIImage(named: "S\(typeofcare[0]).png"), forState: .Normal)
            occasional.setImage(UIImage(named: "\(typeofcare[1]).png"), forState: .Normal)
            parttime.setImage(UIImage(named: "\(typeofcare[2]).png"), forState: .Normal)
            fulltime.setImage(UIImage(named: "\(typeofcare[3]).png"), forState: .Normal)
        }
        else if(sender.tag == 2)
        {
            onetimeonly.setImage(UIImage(named: "\(typeofcare[0]).png"), forState: .Normal)
            occasional.setImage(UIImage(named: "S\(typeofcare[1]).png"), forState: .Normal)
            parttime.setImage(UIImage(named: "\(typeofcare[2]).png"), forState: .Normal)
            fulltime.setImage(UIImage(named: "\(typeofcare[3]).png"), forState: .Normal)
        }
        else if(sender.tag == 3)
        {
            onetimeonly.setImage(UIImage(named: "\(typeofcare[0]).png"), forState: .Normal)
            occasional.setImage(UIImage(named: "\(typeofcare[1]).png"), forState: .Normal)
            parttime.setImage(UIImage(named: "S\(typeofcare[2]).png"), forState: .Normal)
            fulltime.setImage(UIImage(named: "\(typeofcare[3]).png"), forState: .Normal)
        }
        else
        {
            onetimeonly.setImage(UIImage(named: "\(typeofcare[0]).png"), forState: .Normal)
            occasional.setImage(UIImage(named: "\(typeofcare[1]).png"), forState: .Normal)
            parttime.setImage(UIImage(named: "\(typeofcare[2]).png"), forState: .Normal)
            fulltime.setImage(UIImage(named: "S\(typeofcare[3]).png"), forState: .Normal)
        }
    }
    
    
    func updateLayout()
    {
        commonContentView.frame = CGRectMake(self.commonContentView.layer.frame.origin.x, heightTillOptions, self.commonContentView.layer.frame.size.width, self.commonContentView.layer.frame.size.height)
        print("Height till Options : \(heightTillOptions)")
        fullheight=heightTillOptions+self.commonContentView.layer.frame.size.height
        print("Height fullheight : \(fullheight)")
        var contentRect: CGRect = CGRectZero
        for view: UIView in self.scrollView.subviews
        {
                contentRect = CGRectUnion(contentRect, view.frame)
        }
        contentRect.size.height=fullheight+60
        self.scrollView.contentSize = contentRect.size
    }
    
    override func viewWillLayoutSubviews()
    {
        self.scrollView.contentSize = CGSizeMake(self.scrollView.layer.frame.size.width, fullheight)
    }
    
    @IBAction func childCareClick(sender: AnyObject)
    {
        childCare.setImage(UIImage(named: "SChildCare.png"), forState: .Normal)
        seniorCare.setImage(UIImage(named: "SeniorCare.png"), forState: .Normal)
        petsCare.setImage(UIImage(named: "Pets.png"), forState: .Normal)
        houseSitting.setImage(UIImage(named: "HouseSitting.png"), forState: .Normal)
        optionviewSenior.hidden = true
        optionviewChildren.hidden = false
        optionPets.hidden = true
        heightTillOptions=312.0+optionviewChildren.layer.frame.size.height+60
        updateLayout()
    }
    
    @IBAction func seniorClick(sender: AnyObject)
    {
        childCare.setImage(UIImage(named: "ChildCare.png"), forState: .Normal)
        seniorCare.setImage(UIImage(named: "SSeniorCare.png"), forState: .Normal)
        petsCare.setImage(UIImage(named: "Pets.png"), forState: .Normal)
        houseSitting.setImage(UIImage(named: "HouseSitting.png"), forState: .Normal)
        optionviewSenior.hidden = false
        optionviewChildren.hidden = true
        optionPets.hidden = true
        heightTillOptions=312.0+optionviewSenior.layer.frame.size.height
        updateLayout()
    }
    
    
    @IBAction func petClick(sender: AnyObject)
    {
        childCare.setImage(UIImage(named: "ChildCare.png"), forState: .Normal)
        seniorCare.setImage(UIImage(named: "SeniorCare.png"), forState: .Normal)
        petsCare.setImage(UIImage(named: "SPets.png"), forState: .Normal)
        houseSitting.setImage(UIImage(named: "HouseSitting.png"), forState: .Normal)
        optionviewSenior.hidden = true
        optionviewChildren.hidden = true
        optionPets.hidden = false
        heightTillOptions=312.0+optionPets.layer.frame.size.height
        updateLayout()
    }
    
    @IBAction func houseSittingClick(sender: AnyObject)
    {
        childCare.setImage(UIImage(named: "ChildCare.png"), forState: .Normal)
        seniorCare.setImage(UIImage(named: "SeniorCare.png"), forState: .Normal)
        petsCare.setImage(UIImage(named: "Pets.png"), forState: .Normal)
        houseSitting.setImage(UIImage(named: "SHouseSitting.png"), forState: .Normal)
        optionviewSenior.hidden = true
        optionviewChildren.hidden = true
        optionPets.hidden = true
        heightTillOptions=312.0
        updateLayout()
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
    
    @IBAction func nextClick(sender: AnyObject)
    {
        let vc:PostViewController = Globalstory.instantiateViewControllerWithIdentifier("PostViewController") as! PostViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
