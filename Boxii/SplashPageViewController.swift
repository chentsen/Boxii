//
//  SplashPageViewController.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/14/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit
import MediaPlayer

class SplashPageViewController: UIViewController {

    @IBOutlet var loginButton : UIButton = nil
    @IBOutlet var signupButton : UIButton = nil
    @IBOutlet var SignupBackground : UIView = nil
    var movieArray : NSArray?
    var currentMovieIndex = 0
    var moviePlayer : MPMoviePlayerController?
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviePlayer = MPMoviePlayerController()
        self.moviePlayer!.controlStyle = MPMovieControlStyle.None
        self.initializeMovieURLs()
    }

    override func viewWillAppear(animated: Bool) {
        
        var rootNavigationViewController = UIApplication.sharedApplication().delegate.window?.rootViewController as UINavigationController
        rootNavigationViewController.setNavigationBarHidden(true, animated: false)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playNextMovie:", name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
        // Do any additional setup after loading the iew.
    }

    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidAppear(animated: Bool) {
        //later, also check for web connectivity and ability to ping parse api
        if PFUser.currentUser(){
            performSegueWithIdentifier(SEGUE_SPLASH_TO_MY_BOXII, sender: self)
        }else{
            loginButton.hidden = false;
            signupButton.hidden = false;
        }
        self.moviePlayer!.view.frame = self.SignupBackground.bounds
        self.moviePlayer!.scalingMode = MPMovieScalingMode.AspectFill
        self.SignupBackground.addSubview(self.moviePlayer!.view)
        playNextMovie(nil)
        
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
    
    func playNextMovie(notification: NSNotification?){
        
        if currentMovieIndex++ > movieArray!.count - 1{
            currentMovieIndex = 1
        }
        println("\(movieArray!.count) and \(currentMovieIndex)")
        moviePlayer!.contentURL = movieArray![currentMovieIndex-1] as NSURL
        moviePlayer!.prepareToPlay()
        moviePlayer!.play()
        
    }
    func initializeMovieURLs(){
        var beachMoviePath = NSBundle.mainBundle().pathForResource("splash_beach", ofType: "mp4")
        var flowerMoviePath = NSBundle.mainBundle().pathForResource("splash_flower", ofType: "mp4")
        var beachMovieURL = NSURL.fileURLWithPath(beachMoviePath)
        var flowerMovieURL = NSURL.fileURLWithPath(flowerMoviePath)
        movieArray = [beachMovieURL, flowerMovieURL]
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 
    */

}
