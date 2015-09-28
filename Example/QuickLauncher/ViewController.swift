//
//  ViewController.swift
//  QuickLauncher
//
//  Created by Zach McGaughey on 9/28/15.
//  Copyright © 2015 Zach McGaughey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QuickLaunchDelegate {

    
    override func viewDidAppear(animated: Bool) {
        // Using the setDelegateAsReady will set this controller
        // as the delegate and will receive the shortcut action if it exists.
        // It's recommended to call this in viewWillAppear or viewDidAppear
        // if there is visual feedback dependent on the shortcut.
        QuickLauncher.sharedInsatance.setDelegateAsReady(self)
    }
    
    func shortcutInvoked(shortcut: NSObject) {
        // When we are using a shortcut item, we have to specify
        // that this is running on iOS 9. Use the available check
        // before running code using the shortcut.
        if #available(iOS 9.0, *) {
            if let shortcut = shortcut as? UIApplicationShortcutItem {
                switch shortcut.type {
                case "Demo.Type1":
                    showAlert("Type 1 shortcut", message: "Static alert activated")
                case "Demo.Type2":
                    showAlert("Type 2 shortcut", message: "Static alert activated")
                case "Demo.Type.Dynamic":
                    showAlert("Dynamic shortcut", message: "Dynamic alert activated")
                default:
                    break
                }
            }
        }
        
        // We've taken action on this shortcut, clear it to
        // avoid extra calls or attempting to use the shortcut again.
        QuickLauncher.sharedInsatance.clearShortcut()
    }
    
    // MARK: Button actions
    
    /**
    Add a dynamic shortcut that can be launched by the home screen.
    
    - parameter sender: button
    */
    @IBAction func setDynamicButtonPushed(sender: AnyObject) {
        QuickLauncher.sharedInsatance
            .addDynamicShortcut("Demo.Type.Dynamic", title: "Dynamic Shortcut")
    }
    
    /**
    Remove all dynamic shortcuts. None will appear when 3D touching the icon.
    
    - parameter sender: button
    */
    @IBAction func removeDynamicButtonPushed(sender: AnyObject) {
        QuickLauncher.sharedInsatance.resetDynamicShortcuts()
    }
    
    // MARK: Helper functions
    
    func showAlert(title :String, message :String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
}

