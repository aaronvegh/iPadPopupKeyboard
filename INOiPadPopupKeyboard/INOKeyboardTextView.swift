//
//  INOKeyboardTextView.swift
//  INOiPadPopupKeyboard
//
//  Created by Aaron Vegh on 2016-01-11.
//  Copyright © 2016 Aaron Vegh. All rights reserved.
//

import UIKit

class INOKeyboardTextView: UITextView, UITextViewDelegate, UIPopoverPresentationControllerDelegate {
    var activationBlock:((textView:INOKeyboardTextView) -> ())?
    var viewController:UIViewController? {
        didSet {
            self.activationBlock = { (textView:INOKeyboardTextView) -> () in
                if let keyboardVC = NSBundle.mainBundle().loadNibNamed("INOKeyboardViewController", owner: self, options: nil).first as? INOKeyboardViewController {
                    keyboardVC.modalPresentationStyle = .Popover
                    keyboardVC.preferredContentSize = CGSize(width: 450, height: 240)
                    keyboardVC.textEnteredBlock = { (value:String) -> () in
                        if value == "Backspace" {
                            self.deleteBackward()
                        }
                        else {
                            self.insertText(value)
                        }
                    }
                    
                    self.viewController!.presentViewController(keyboardVC, animated: true, completion: nil)
                    
                    let presentationController = keyboardVC.popoverPresentationController
                    presentationController?.delegate = self
                    presentationController?.backgroundColor = UIColor(hue:0, saturation:0, brightness:0.855, alpha:1)
                    presentationController?.permittedArrowDirections = [.Any]
                    presentationController?.passthroughViews = [self]
                    presentationController?.sourceView = self
                    presentationController?.sourceRect = self.bounds
                }
            }
        }
    }
    
    override func awakeFromNib() {
        self.delegate = self
        self.autocorrectionType = .No
        let item:UITextInputAssistantItem = self.inputAssistantItem
        item.leadingBarButtonGroups = []
        item.trailingBarButtonGroups = []
        self.inputView = UIView()
    }
    
    override func becomeFirstResponder() -> Bool {
        if !self.isFirstResponder() {
            super.becomeFirstResponder()
            if let block = self.activationBlock {
                block(textView: self)
            }
        }
        return true
    }
    
    override func shouldChangeTextInRange(range: UITextRange, replacementText text: String) -> Bool {
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        self.resignFirstResponder()
    }

}
