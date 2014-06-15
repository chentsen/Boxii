//
//  RegistrationViewController.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/14/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController {

    @IBOutlet var phoneNumberEndInput : UITextField = nil
    @IBOutlet var phoneNumberStartInput : UITextField = nil
    @IBOutlet var areacodeInput : UITextField = nil
    @IBOutlet var emailInput : UITextField = nil
    @IBOutlet var passwordInput : UITextField = nil
    var authenticationModel : AuthenticationModel?
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        var rootNavigationController:UINavigationController = UIApplication.sharedApplication().delegate.window?.rootViewController as UINavigationController
            rootNavigationController.setNavigationBarHidden(false, animated: true)

            NSNotificationCenter.defaultCenter().addObserver(self, selector: "loginFromRegistration:", name: NOTIFICATION_REGISTRATION_SUCCESS, object: nil)

            NSNotificationCenter.defaultCenter().addObserver(self, selector: "loginSuccess:", name: NOTIFICATION_LOGIN_SUCCESS, object: nil)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
    @IBAction func signupButtonPressed(sender : AnyObject) {
        println("signup button pressed")
        var phoneNumber = "\(areacodeInput.text)\(phoneNumberStartInput.text)\(phoneNumberEndInput.text)"
        self.authenticationModel = AuthenticationModel(email: emailInput.text, phoneNumber: phoneNumber, password: passwordInput.text)
        self.authenticationModel!.register()
    }

    /*Login selector to be called only after registration has succeeded*/
    func loginFromRegistration(sender:AnyObject!){
        if self.authenticationModel{
            self.authenticationModel!.login()
        }
    }

    func loginSuccess(sender:AnyObject!){
        self.performSegueWithIdentifier(SEGUE_REGISTRATION_TO_PROFILE, sender: self)
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
