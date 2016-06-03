//
//  MainLoginViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/11/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class MainLoginViewController: CommonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        currentController = "MainLoginViewController"
        setupCommonView()
        
        self.title = "Sign In"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    @IBAction func LoginBtnTapped(sender: AnyObject)
    {
        let Socialvc:WelcomeViewController = Globalstory.instantiateViewControllerWithIdentifier("WelcomeViewController") as! WelcomeViewController
        self.navigationController?.pushViewController(Socialvc, animated: true)
    }
   
}
