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
    init(email:NSString, password:NSString, phoneNumber:NSString){
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
    }
}
