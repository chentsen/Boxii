//
//  errorHandler.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/15/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit

class ErrorHandler: NSObject {

    class func addError(title:NSString?, message:NSString, errorCode:NSInteger){
        var safe_title : NSString = "Whoops!"
        if title{
            safe_title = title!
        }
        var userInfo : NSDictionary? = ["message":message, "errorCode":errorCode, "title":safe_title]
        NSNotificationCenter.defaultCenter().postNotificationName(NOTIFICATION_ERROR, object:ErrorHandler() , userInfo: userInfo )

    }
}
