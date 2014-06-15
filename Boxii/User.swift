//
//  User.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/15/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit

class User: NSObject {
    var email:NSString
    var password:NSString
    var phoneNumber:NSString
    /*Initializer that attempts to load based on current user. Should only be used once user has logged in*/
    init(){
        self.email = PFUser.currentUser().email
        self.password = PFUser.currentUser().password
        self.phoneNumber = PFUser.currentUser()["phone"] as NSString
    }
    init(email:NSString, password:NSString, phoneNumber:NSString){
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
    }
}
