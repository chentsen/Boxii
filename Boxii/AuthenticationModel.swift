//
//  RegistrationModel.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/15/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit

class AuthenticationModel: NSObject {
    var email:NSString
    var phoneNumber:NSString
    var password:NSString
    init(email:NSString, phoneNumber:NSString?, password:NSString){
        self.email = email
        if phoneNumber{
            self.phoneNumber = phoneNumber!
        }else{
            self.phoneNumber = "NAN"
        }
        self.password = password
    }

    
    func register(){
        var user = User(email:self.email, password:self.password, phoneNumber:self.phoneNumber)
        var pf_user = PFUser()
        pf_user.username = user.email
        pf_user.email = user.email
        pf_user.password = user.password
        pf_user["phone"] = user.phoneNumber
        var pf_query = PFUser.query()
        pf_query.whereKey("phone", equalTo: self.phoneNumber)
        pf_query.findObjectsInBackgroundWithBlock({(objects:AnyObject[]!,errors:NSError!) in
            if objects.count == 0{
                pf_user.signUpInBackgroundWithBlock({(succeeded:Bool!, error:NSError!) in
                    if(!error){
                        println("User Created!!")
                        NSNotificationCenter.defaultCenter().postNotificationName(NOTIFICATION_REGISTRATION_SUCCESS, object: self)
                    }else{
                        println("There was an error")
                    }
                    })
            }else{
                println("Phone number exists")
            }
        })
    }
    func login(){
        PFUser.logInWithUsernameInBackground(self.email, password: self.password, block: {(user:PFUser!, error:NSError!) in
            if user{
                NSNotificationCenter.defaultCenter().postNotificationName(NOTIFICATION_LOGIN_SUCCESS, object: self)
            }else {
                NSNotificationCenter.defaultCenter().postNotificationName(NOTIFICATION_ERROR, object: self, userInfo: ["error message":"There was an issue logging in, try again later", "code":401])
            }
        })
    }
}
    

    

