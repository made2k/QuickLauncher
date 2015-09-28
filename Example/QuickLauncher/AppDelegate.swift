//
//  AppDelegate.swift
//  QuickLauncher
//
//  Created by Zach McGaughey on 9/28/15.
//  Copyright © 2015 Zach McGaughey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Extract any shortcut that may have launched the app.
        // We don't need to take any action here, but will
        // let our view controller take action on the shortcut.
        QuickLauncher.sharedInsatance.setupShortcutFromLaunchOptions(launchOptions)
        return true
    }
    
    // This class is provided by UIKit. Add the @available annotation to
    // allow it to work with non iOS 9 devices.
    @available(iOS 9.0, *)
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        QuickLauncher.sharedInsatance.setShortCut(shortcutItem)
    }


}

