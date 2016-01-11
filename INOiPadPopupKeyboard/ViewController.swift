//
//  ViewController.swift
//  INOiPadPopupKeyboard
//
//  Created by Aaron Vegh on 2016-01-09.
//  Copyright © 2016 Aaron Vegh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet var textField:INOKeyboardTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.activationBlock = { (textField:INOKeyboardTextField) -> () in
            if let keyboardVC = NSBundle.mainBundle().loadNibNamed("INOKeyboardViewController", owner: self, options: nil).first as? INOKeyboardViewController {
                keyboardVC.modalPresentationStyle = .Popover
                keyboardVC.preferredContentSize = CGSize(width: 450, height: 250)
                keyboardVC.textEnteredBlock = { (value:String) -> () in
                    if value == "Backspace" {
                        self.textField.deleteBackward()
                    }
                    else {
                        self.textField.insertText(value)
                    }
                }
                
                self.presentViewController(keyboardVC, animated: true, completion: nil)
                
                let presentationController = keyboardVC.popoverPresentationController
                presentationController?.delegate = self
                presentationController?.backgroundColor = UIColor.whiteColor()
                presentationController?.permittedArrowDirections = [.Up]
                presentationController?.sourceView = self.textField
                presentationController?.sourceRect = CGRectInset(self.textField.frame, self.textField.bounds.size.width / 2, self.textField.bounds.size.height / 2)
            }
        }
        
        
    }

    

}

