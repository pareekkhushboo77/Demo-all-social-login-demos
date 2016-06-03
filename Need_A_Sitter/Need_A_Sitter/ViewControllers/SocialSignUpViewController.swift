//
//  SocialSignUpViewController.swift
//  Need_A_Sitter
//
//  Created by Ratnakala58 on 4/5/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import TwitterKit


class SocialSignUpViewController: CommonViewController,GIDSignInDelegate,GIDSignInUIDelegate
{

    @IBOutlet weak var SignUpEmailView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentController = "EmailSignUpViewController"
        self.title = "\(userType) Sign Up"
        setupCommonView()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        /*
        https://maonet.wordpress.com/2015/09/29/signin-with-googleplus-in-ios-app-without-flipping-between-safari/
        
        The main purpose of using new SDK is to remove flipping between Safari, but if you do what to use flipping Safari to login google+, set allowsSignInWithWebView to NO, wala! you are back to old times, and get ready to see your app being rejected by Apple.
        */
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
    
    @IBAction func FacebookSignUp(sender: AnyObject)
    {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["public_profile","email","user_friends"], handler: { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                self.getFBUserData()
            }
            else
            {
                Processcall.hideLoadingWithView()
                
                let alert : UIAlertController = UIAlertController(title: "Warning!", message:"Try after some time.", preferredStyle: UIAlertControllerStyle.Alert)
                
                let validation : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (action) -> Void in
                    
                    alert.dismissViewControllerAnimated(true, completion: nil)
                })
                alert.addAction(validation)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
    }
    
    func getFBUserData()
    {
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            Processcall.showLoadingWithView(self.view, withLabel: "Connecting...")
            let request = FBSDKGraphRequest(graphPath:"me", parameters:["fields":"first_name, last_name, picture.type(large),email,gender"])
            
            // Send request to Facebook
            request.startWithCompletionHandler {
                
                (connection, result, error) in
                
                if error != nil {
                    // Some error checking here
                }
                    
                else if let userData = result as? [String:AnyObject] {
                    
                    print(userData)
                    Processcall.hideLoadingWithView()
                    
                    signUpUserDetails.setObject("\(result.objectForKey("first_name"))", forKey: "Firstname")
                    signUpUserDetails.setObject("\(result.objectForKey("last_name"))", forKey: "Lastname")
                    signUpUserDetails.setObject("\(result.objectForKey("email"))", forKey: "Email")
                    signUpUserDetails.setObject("\(result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url"))", forKey: "Profilepicture")
                }
            }
            
        }
        else
        {
            print("GO TO SIGNN IN VIEW")
            /*let homeView: SigninViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SigninVC") as! SigninViewController
            
            let navigation : UINavigationController = UINavigationController(rootViewController: homeView)
            
            navigation.navigationBarHidden = true*/
            
        }
    }
    
    @IBAction func EmailSignUp(sender: AnyObject)
    {
        let Socialvc:EmailSignUpViewController = Globalstory.instantiateViewControllerWithIdentifier("EmailSignUpViewController") as! EmailSignUpViewController
        self.navigationController?.pushViewController(Socialvc, animated: true)
    }
    
    @IBAction func LinkedinSignUp(sender: AnyObject)
    {
        LISDKSessionManager.createSessionWithAuth([LISDK_BASIC_PROFILE_PERMISSION,LISDK_EMAILADDRESS_PERMISSION], state: nil, showGoToAppStoreDialog: true, successBlock: { (returnState) -> Void in
            print("success called!")
            print(LISDKSessionManager.sharedInstance().session)
            
            let url = "https://api.linkedin.com/v1/people/~:(id,industry,firstName,lastName,emailAddress,headline,summary,publicProfileUrl,specialties,positions:(id,title,summary,start-date,end-date,is-current,company:(id,name,type,size,industry,ticker)),pictureUrls::(original),location:(name))?format=json"
            
            //let url = "https://api.linkedin.com/v1/people/~"
            
            if LISDKSessionManager.hasValidSession()
            {
                LISDKAPIHelper.sharedInstance().getRequest(url, success: { (response) -> Void in
                    print(response)
                    
                    let data:NSData = response.data.dataUsingEncoding(NSUTF8StringEncoding)!
                    do
                    {
                        let dictResp = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                        
                        print("Response : \(dictResp)")
                        
                        //let authFirstName = dictResp.valueForKey("firstName")
                        //let authLastName = dictResp.valueForKey("lastName")
                    }
                    catch
                    {
                        print("ERROR IN JSON!")
                    }
                    }, error: { (error) -> Void in
                        print("ERROROROR")
                        LISDKAPIHelper.sharedInstance().cancelCalls()
                        LISDKSessionManager.clearSession()
                        
                        print(error.localizedDescription)
                })
            }
            }) { (error) -> Void in
                print("%s", "error called!")
                
                LISDKAPIHelper.sharedInstance().cancelCalls()
                LISDKSessionManager.clearSession()
                
                
                let refreshAlert = UIAlertController(title: "Need A Sitter", message: "Do you want to Login from webview?", preferredStyle: UIAlertControllerStyle.Alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
                
                    print("Webview Yes")
                    let vc:LinkedinWebViewViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LinkedinWebViewViewController") as! LinkedinWebViewViewController
                    self.presentViewController(vc, animated: true, completion: nil)
                }))
                
                refreshAlert.addAction(UIAlertAction(title: "No", style: .Default, handler: { (action: UIAlertAction!) in
                    //println("Handle Cancel Logic here")
                }))
                
                self.presentViewController(refreshAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func LoginButton(sender: AnyObject)
    {
        let Socialvc:WelcomeViewController = Globalstory.instantiateViewControllerWithIdentifier("WelcomeViewController") as! WelcomeViewController
        self.navigationController?.pushViewController(Socialvc, animated: true)
    }
    
    @IBAction func TwitterSignUp(sender: AnyObject)
    {
        
        Twitter.sharedInstance().logInWithMethods([.WebBased]) { session, error in
            if (session != nil) {
                print("signed in as \(session!.userName)");
            
                let client = TWTRAPIClient.clientWithCurrentUser()
                let request = client.URLRequestWithMethod("GET",
                URL: "https://api.twitter.com/1.1/account/verify_credentials.json",
                parameters: ["include_email": "true", "skip_status": "true"],
                error: nil)
                
                client.sendTwitterRequest(request) { response, data, connectionError in
                print(data)
                    do
                    {
                        let dictResp = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                        
                        print("Response : \(dictResp)")
                        
                        //let authFirstName = dictResp.valueForKey("firstName")
                        //let authLastName = dictResp.valueForKey("lastName")
                    }
                    catch
                    {
                        print("ERROR IN JSON TWITTER!")
                    }
                }
            } else {
                print("error: \(error!.localizedDescription)");
            }
        }
    }
    
    @IBAction func GoogleSignUp(sender: AnyObject)
    {
        let signin = GIDSignIn.sharedInstance()
        signin.delegate = self
        signin.uiDelegate = self
        signin.allowsSignInWithBrowser = false
        signin.shouldFetchBasicProfile = true
        signin.allowsSignInWithWebView = true
        signin.scopes = ["https://www.googleapis.com/auth/plus.login","https://www.googleapis.com/auth/userinfo.email","https://www.googleapis.com/auth/userinfo.profile"]
        signin.clientID = "526499103591-mfbliaaphmj8vg1ofdi1q347vdusslsb.apps.googleusercontent.com"
        signin.signIn()
    }
    
    
    //MARK:- Google SignIn Delegates
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!)
    {
        if (error == nil)
        {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            //let givenName = user.profile.givenName
            //let familyName = user.profile.familyName
            let email = user.profile.email
            
            print(email)
            if user.profile.hasImage
            {
                let pic = user.profile.imageURLWithDimension(100)
                print(pic)
                signUpUserDetails.setObject(pic, forKey: "Profilepicture")
            }
            
            signUpUserDetails.setObject("\(fullName)", forKey: "Firstname")
            signUpUserDetails.setObject("\(fullName)", forKey: "Lastname")
            signUpUserDetails.setObject("\(email)", forKey: "Email")
            //signUpUserDetails.setObject("\(result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url"))", forKey: "Profilepicture")
        }
        else
        {
            print("\(error.localizedDescription)")
        }
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,withError error: NSError!)
    {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
}
