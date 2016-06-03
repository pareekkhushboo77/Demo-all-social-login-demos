//
//  LoginViewViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/5/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class LoginViewViewController: UIViewController
{

    @IBOutlet weak var slidingWrapperView: UIView!
    @IBOutlet weak var slidingLabel: UILabel!
    
    var timer = NSTimer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "LoginViewViewController"
//        self.setNavigationBarItem()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "update", userInfo: nil, repeats: true)
    }

    func update()
    {
        self.slidingLabel.slideInFromLeft()
        //		self.slidingTextLabel.slideInFromLeft(duration: 1.0, completionDelegate: self) // Use this line to specify a duration or completionDelegate
        self.slidingLabel.text = "Find the right person to fit your families caregiver needs"
    }
    
    // This function is only called if you set a completionDelegate in your slideInFromLeft() call
    override func animationDidStop(anim: CAAnimation, finished flag: Bool)
    {
        print("Animation stopped")
    }
    
    override func viewWillAppear(animated: Bool)
    {
//        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ParentSignUpButton(sender: AnyObject)
    {
        let Socialvc:SocialSignUpViewController = Globalstory.instantiateViewControllerWithIdentifier("SocialSignUpViewController") as! SocialSignUpViewController
        userType = "Parent"
        
        //nvc.pushViewController(Socialvc, animated: true)
        
        self.navigationController?.pushViewController(Socialvc, animated: true)
    }

    @IBAction func SitterSignUpButton(sender: AnyObject)
    {
        let Socialvc:SocialSignUpViewController = Globalstory.instantiateViewControllerWithIdentifier("SocialSignUpViewController") as! SocialSignUpViewController
        userType = "Sitter"
//        nvc.pushViewController(Socialvc, animated: true)
        self.navigationController?.pushViewController(Socialvc, animated: true)
    }
    
    @IBAction func LoginButtonTapped(sender: AnyObject)
    {
        let Socialvc:MainLoginViewController = Globalstory.instantiateViewControllerWithIdentifier("MainLoginViewController") as! MainLoginViewController
        self.navigationController?.pushViewController(Socialvc, animated: true)
    }
    /*
    
    // for rotating label you can put label inside view and you rotate view then label automatically rotate by self.
    
    // e.g testView.transform = CGAffineTransformMakeRotation(30 * M_PI / 180.0);
    // label.transform = CGAffineTransformMakeRotation(M_PI / 4);
    //     self.dayLabel.transform = CGAffineTransformMakeRotation(-90)
    */

}
//extension UIViewController {
//    
//    func setNavigationBarItem()
//    {
//        
//        
//        
//    }
//    
//    
//}
