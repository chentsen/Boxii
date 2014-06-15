//
//  SplashPageViewController.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/14/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit

class SplashPageViewController: UIViewController {

    @IBOutlet var loginButton : UIButton = nil
    @IBOutlet var signupButton : UIButton = nil
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        

    }

    override func viewWillAppear(animated: Bool) {
        var rootNavigationViewController = UIApplication.sharedApplication().delegate.window?.rootViewController as UINavigationController
        rootNavigationViewController.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        //later, also check for web connectivity and ability to ping parse api
        if PFUser.currentUser(){
            performSegueWithIdentifier(SEGUE_SPLASH_TO_MY_BOXII, sender: self)
        }else{
            loginButton.hidden = false;
            signupButton.hidden = false;
        }

//        alertView.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupButtonPressed(sender : AnyObject) {
        performSegueWithIdentifier(SEGUE_SPLASH_TO_SIGNUP, sender:self)
    }
    
    @IBAction func loginButtonPressed(sender : AnyObject) {
        performSegueWithIdentifier(SEGUE_SPLASH_TO_LOGIN, sender:self)
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 
    */

}
