//
//  CertificateViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/12/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class CertificateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        currentController="CertificateViewController"
       // self.setNavigationBarItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
