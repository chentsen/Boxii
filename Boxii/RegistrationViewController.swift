//
//  RegistrationViewController.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/14/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController {

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
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
