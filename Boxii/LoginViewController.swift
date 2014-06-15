//
//  LoginViewController.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/14/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var passwordInput : UITextField = nil
    @IBOutlet var emailInput : UITextField = nil
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        var rootNavigationController:UINavigationController = UIApplication.sharedApplication().delegate.window?.rootViewController as UINavigationController
        rootNavigationController.setNavigationBarHidden(false, animated: true)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loginSuccess:", name: NOTIFICATION_LOGIN_SUCCESS, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @IBAction func loginButtonPressed(sender : AnyObject) {
        SVProgressHUD.show()
        self.authenticationModel = AuthenticationModel(email:self.emailInput.text,phoneNumber:nil,password:passwordInput.text)
        self.authenticationModel!.login()
        
    }
    
    func loginSuccess(sender:AnyObject!){
        SVProgressHUD.dismissHUDAsync()
        self.performSegueWithIdentifier(SEGUE_LOGIN_TO_MY_BOXII, sender: self)
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
