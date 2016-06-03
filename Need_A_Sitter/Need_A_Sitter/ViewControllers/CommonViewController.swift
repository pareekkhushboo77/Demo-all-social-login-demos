//
//  CommonViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/6/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class CommonViewController: UIViewController
{

    let arr:NSArray = ["Home","Drop Down Menu","Custom Picker","Custom Date Picker"]
//

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
    }

    
    override func viewWillAppear(animated: Bool)
    {
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func setupCommonView()
    {
        setupNavigation()
        leftBackButton()
    }
    
//    func setupAppHeaderView()
//    {
//        setupNavigation()
//        leftMenuButton()
//        rightAddButton()
//        titleImage()
//    }
    
    //Greeen Line below Navigation Bar.
    func setupNavigation()
    {
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        
        self.navigationController?.navigationBar.layer.shadowRadius = 0;
        self.navigationController?.navigationBar.layer.shadowOffset = CGSizeMake(0, 3);
        self.navigationController?.navigationBar.layer.shadowOpacity = 1;
        self.navigationController?.navigationBar.layer.shadowColor = UIColor(red: 125/255, green: 199/255, blue: 109/255, alpha: 1).CGColor
        
        
        let path:UIBezierPath = UIBezierPath(rect: self.navigationController!.navigationBar.bounds)
        self.navigationController?.navigationBar.layer.shadowPath = path.CGPath;
    }
    
    func leftBackButton()
    {
        //create a new button
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        //set image for button
        button.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        //add function for button
        button.addTarget(self, action: "backButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRectMake(10, 20, 22, 32)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    //This method will call when you press button.
    func backButtonPressed()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    //This method will call when you press button.
    
    
    func rightAddButton()
    {
        //create a new button
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        //set image for button
        button.setImage(UIImage(named: "plus.png"), forState: UIControlState.Normal)
        //add function for button
        button.addTarget(self, action: "addButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRectMake(0, 0, 35, 31)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    //This method will call when you press button.
    func addButtonPressed()
    {
        print("Add From Commons!")
    }
    
    func titleImage()
    {
        let image : UIImage = UIImage(named: "NASTitle.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 50))
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        //navigationItem.titleView = UIImageView.init(image: UIImage(named:"NASTitle.png"))
    }

}
