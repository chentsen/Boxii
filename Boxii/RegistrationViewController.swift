//
//  RegistrationViewController.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/14/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController, UITextFieldDelegate {


  
    @IBOutlet var phoneNumberInput : UITextField = nil
    @IBOutlet var emailInput : UITextField = nil
    @IBOutlet var passwordInput : UITextField = nil
    @IBOutlet var scrollView : UIScrollView = nil
    var activeField : UITextField?
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
        
        self.phoneNumberInput.delegate = self
        self.emailInput.delegate = self
        self.passwordInput.delegate = self
        self.registerForKeyboardNotifications()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldBeginEditing(textField:UITextField) -> Bool{
        return true
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(textField:UITextField){
        self.activeField = textField
    }
    func textFieldDidEndEditing(textField:UITextField){
        self.activeField = nil
    }
    
    func keyboardWasShown(notification: NSNotification){
        println("keyboard is shown")
        var info = notification.userInfo
        var kbSize = info["UIKeyboardFrameBeginUserInfoKey"].CGRectValue().size
        
        
        var contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
        scrollView.contentInset = contentInsets;
        scrollView.scrollIndicatorInsets = contentInsets;
        var aRect = self.view.frame;
        aRect.size.height -= kbSize.height;
        
        var origin = self.activeField!.frame.origin;
        origin.y -= scrollView.contentOffset.y;
        if (!CGRectContainsPoint(aRect, origin) ) {
            var scrollPoint = CGPointMake(0.0, self.activeField!.frame.origin.y-(aRect.size.height));
            scrollView.setContentOffset(scrollPoint, animated: true)
        }
    
    }
    
    func keyboardWasHidden(notification:NSNotification){
        println("keyboard hidden")
        var contentInsets = UIEdgeInsetsZero
        var testInsets = UIEdgeInsetsMake(500, 500, 500, 500)
        scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        //scrollView.scrollIndicatorInsets = testInsets
    }

    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!){
        for  txt : AnyObject in self.view.subviews{
            if (txt is UITextField  && txt.isFirstResponder()) {
                txt.resignFirstResponder()
            }
        }
    }
    
    
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool{
        var newLength = (textField.text as NSString).length + (string as NSString).length - range.length
        if newLength > 10 && (textField == self.phoneNumberInput){
           
        return true
    }
    
    func registerForKeyboardNotifications(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasHidden:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        var rootNavigationController:UINavigationController = UIApplication.sharedApplication().delegate.window?.rootViewController as UINavigationController
            rootNavigationController.setNavigationBarHidden(false, animated: true)

            NSNotificationCenter.defaultCenter().addObserver(self, selector: "loginFromRegistration:", name: NOTIFICATION_REGISTRATION_SUCCESS, object: nil)

            NSNotificationCenter.defaultCenter().addObserver(self, selector: "loginSuccess:", name: NOTIFICATION_LOGIN_SUCCESS, object: nil)

    }
    /*
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
    @IBAction func signupButtonPressed(sender : AnyObject) {
        SVProgressHUD.show()
        self.authenticationModel = AuthenticationModel(email: emailInput.text, phoneNumber: self.phoneNumberInput.text, password: passwordInput.text)
        self.authenticationModel!.register()
    }

    /*Login selector to be called only after registration has succeeded*/
    func loginFromRegistration(sender:AnyObject!){
        if self.authenticationModel{
            self.authenticationModel!.login()
        }
    }

    func loginSuccess(sender:AnyObject!){
        SVProgressHUD.dismissHUDAsync()
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
