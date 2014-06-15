//
//  RegistrationModel.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/15/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit

class RegistrationModel: NSObject {
    func registerWithEmail(email:NSString, phoneNumber:NSString, password:NSString) -> Bool{
        var user = User(email:email, password:password, phoneNumber:phoneNumber)
        var pf_user = PFUser()
        pf_user.username = user.email
        pf_user.email = user.email
        pf_user.password = user.password
        pf_user["phone"] = user.phoneNumber
        pf_user.saveInBackgroundWithBlock({(succeeded:Bool!, error:NSError!) in
            if(!error){
                //success
                println("User Created!!")
            }else{
                println(error.userInfo["error"])
            }
            })
        return false
        
    }
    
}
