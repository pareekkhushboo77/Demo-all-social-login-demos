//
//  EmailSignUpViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/5/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class EmailSignUpViewController: CommonViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "EmailSignUpViewController"
        setupCommonView()

    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func backButton(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func signUpButtonTapped(sender: AnyObject)
    {
        let Socialvc:MainLoginViewController = Globalstory.instantiateViewControllerWithIdentifier("MainLoginViewController") as! MainLoginViewController
        self.navigationController?.pushViewController(Socialvc, animated: true)
    }
}
