//
//  SVProgressHUDExtension.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/15/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

protocol HUDExtensionProtocol{
    class func dismissHUDAsync()
}

extension SVProgressHUD:HUDExtensionProtocol {
     class func dismissHUDAsync(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            dispatch_async(dispatch_get_main_queue(), {
                SVProgressHUD.dismiss()
                });
            })
    }

}
