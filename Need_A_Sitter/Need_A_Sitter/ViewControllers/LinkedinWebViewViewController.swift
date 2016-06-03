//
//  LinkedinWebViewViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/25/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit

class LinkedinWebViewViewController: UIViewController
{

    @IBOutlet weak var webView: UIWebView!
    // MARK: Constants
    
    let linkedInKey = "75nhrun9g5cpvj"
    
    let linkedInSecret = "jMJdkUK2r5sMKeiS"
    
    let authorizationEndPoint = "https://www.linkedin.com/uas/oauth2/authorization"
    
    let accessTokenEndPoint = "https://www.linkedin.com/uas/oauth2/accessToken"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        startAuthorization()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    
    }
    

    @IBAction func CancelBtn(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Custom Functions
    
    func startAuthorization()
    {
        // Specify the response type which should always be "code".
        let responseType = "code"
        
        // Set the redirect URL. Adding the percent escape characthers is necessary.
        let redirectURL = "https://com.appcoda.linkedin.oauth/oauth".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
        
        // Create a random string based on the time intervale (it will be in the form linkedin12345679).
        let state = "linkedin\(Int(NSDate().timeIntervalSince1970))"
        
        // Set preferred scope.
        let scope = "r_basicprofile,r_emailaddress"
        
        // Create the authorization URL string.
        var authorizationURL = "\(authorizationEndPoint)?"
        authorizationURL += "response_type=\(responseType)&"
        authorizationURL += "client_id=\(linkedInKey)&"
        authorizationURL += "redirect_uri=\(redirectURL)&"
        authorizationURL += "state=\(state)&"
        authorizationURL += "scope=\(scope)"
        
        print(authorizationURL)
        
        
        // Create a URL request and load it in the web view.
        let request = NSURLRequest(URL: NSURL(string: authorizationURL)!)
        webView.loadRequest(request)
    }
    
    func requestForAccessToken(authorizationCode: String)
    {
        let grantType = "authorization_code"
        
        let redirectURL = "https://com.appcoda.linkedin.oauth/oauth".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
        
        // Set the POST parameters.
        var postParams = "grant_type=\(grantType)&"
        postParams += "code=\(authorizationCode)&"
        postParams += "redirect_uri=\(redirectURL)&"
        postParams += "client_id=\(linkedInKey)&"
        postParams += "client_secret=\(linkedInSecret)"
        
        // Convert the POST parameters into a NSData object.
        let postData = postParams.dataUsingEncoding(NSUTF8StringEncoding)
        
        // Initialize a mutable URL request object using the access token endpoint URL string.
        let request = NSMutableURLRequest(URL: NSURL(string: accessTokenEndPoint)!)
        
        // Indicate that we're about to make a POST request.
        request.HTTPMethod = "POST"
        
        // Set the HTTP body using the postData object created above.
        request.HTTPBody = postData
        
        // Add the required HTTP header field.
        request.addValue("application/x-www-form-urlencoded;", forHTTPHeaderField: "Content-Type")
        
        
        // Initialize a NSURLSession object.
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        // Make the request.
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            // Get the HTTP status code of the request.
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            
            if statusCode == 200
            {
                // Convert the received JSON data into a dictionary.
                do
                {
                    let dataDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                    
                    let accessToken = dataDictionary["access_token"] as! String
                    
                    NSUserDefaults.standardUserDefaults().setObject(accessToken, forKey: "LIAccessToken")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
//                        let vc:LogoutViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LogoutViewController") as! LogoutViewController
//                        self.presentViewController(vc, animated: true, completion: nil)
//                        //self.dismissViewControllerAnimated(true, completion: nil)
                        self.getUserData()
                    })
                }
                catch {
                    print("Could not convert JSON data into a dictionary.")
                }
            }
        }
        task.resume()
    }
    
    func getUserData()
    {
        if let accessToken = NSUserDefaults.standardUserDefaults().objectForKey("LIAccessToken")
        {
            // Specify the URL string that we'll get the profile info from.
            //let targetURLString = "https://api.linkedin.com/v1/people/~:(public-profile-url)?format=json"
            let targetURLString = "https://api.linkedin.com/v1/people/~:(id,emailAddress,first-name,last-name,publicProfileUrl,formatted-name,picture-url)?format=json"
            //let targetURLString1 = "https://api.linkedin.com/v1/people/~"
            
            
            // Initialize a mutable URL request object.
            let request = NSMutableURLRequest(URL: NSURL(string: targetURLString)!)
            
            // Indicate that this is a GET request.
            request.HTTPMethod = "GET"
            
            // Add the access token as an HTTP header field.
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            
            // Initialize a NSURLSession object.
            let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
            
            // Make the request.
            let task: NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
                // Get the HTTP status code of the request.
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                
                if statusCode == 200
                {
                    // Convert the received JSON data into a dictionary.
                    do
                    {
                        let dataDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                        
                        print("RESPONSE : \(dataDictionary)")
                        
//                        let profileURLString = ""//dataDictionary["publicProfileUrl"] as! String
//                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                            self.btnOpenProfile.setTitle(profileURLString, forState: UIControlState.Normal)
//                            self.btnOpenProfile.hidden = false
//                        })
                    }
                    catch {
                        print("Could not convert JSON data into a dictionary.")
                    }
                }
            }
            task.resume()
        }
    }
    
    
    // MARK: UIWebViewDelegate Functions
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        let url = request.URL!
        print(url)
        
        if url.host == "com.appcoda.linkedin.oauth"
        {
            if url.absoluteString.rangeOfString("code") != nil
            {
                // Extract the authorization code.
                let urlParts = url.absoluteString.componentsSeparatedByString("?")
                let code = urlParts[1].componentsSeparatedByString("=")[1]
                
                requestForAccessToken(code)
            }
        }
        return true
    }
    
}
