//
//  HeaderViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/22/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController
{

    @IBOutlet weak var imageViewNAS: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func MenuClick(sender: AnyObject)
    {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
}
