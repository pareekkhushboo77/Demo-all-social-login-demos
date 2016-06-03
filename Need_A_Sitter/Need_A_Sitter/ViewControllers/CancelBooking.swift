//
//  CancelBooking.swift
//  Need_A_Sitter
//
//  Created by Ratnakala33 on 4/12/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class CancelBooking: UIViewController
{

    @IBOutlet weak var bottomlabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        currentController = "CancelBooking"
        
        //self.setNavigationBarItem()
        
        bottomlabel.layer.borderColor = UIColor(red: 67/255, green: 150/255, blue: 199/255, alpha: 1).CGColor
        bottomlabel.layer.borderWidth = 2
        bottomlabel.layer.cornerRadius = 5
        bottomlabel.layer.masksToBounds = true
        
    }
    
    @IBAction func backAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    
    }
    
}
