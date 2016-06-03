//
//  ProfileThanksViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class ProfileThanksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        currentController = "ProfileThanksViewController"
//self.setNavigationBarItem()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SearchSitterClick(sender: AnyObject)
    {
        let vc:ParentDashBoardViewController = Globalstory.instantiateViewControllerWithIdentifier("ParentDashBoardViewController") as! ParentDashBoardViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func postJobClick(sender: AnyObject)
    {
        let vc:NewPostViewController = Globalstory.instantiateViewControllerWithIdentifier("NewPostViewController") as! NewPostViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

}
