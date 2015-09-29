/*
The MIT License (MIT)

Copyright (c) 2015 Zach McGaughey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

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

