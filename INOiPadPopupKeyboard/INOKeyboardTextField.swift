//
//  INOKeyboardTextField.swift
//  INOiPadPopupKeyboard
//
//  Created by Aaron Vegh on 2016-01-09.
//  Copyright © 2016 Aaron Vegh. All rights reserved.
//

import UIKit

class INOKeyboardTextField: UITextField, UITextFieldDelegate, UIPopoverPresentationControllerDelegate {
    
    var activationBlock:((textField:INOKeyboardTextField) -> ())?
    var viewController:UIViewController? {
        didSet {
            self.activationBlock = { (textField:INOKeyboardTextField) -> () in
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
                    presentationController?.backgroundColor = UIColor.whiteColor()
                    presentationController?.permittedArrowDirections = [.Any]
                    presentationController?.passthroughViews = [self]
                    presentationController?.sourceView = self
                    presentationController?.sourceRect = self.frame
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
        super.becomeFirstResponder()
        if let block = self.activationBlock {
            block(textField: self)
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
