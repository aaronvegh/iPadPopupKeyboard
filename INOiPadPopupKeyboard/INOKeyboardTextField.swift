//
//  INOKeyboardTextField.swift
//  INOiPadPopupKeyboard
//
//  Created by Aaron Vegh on 2016-01-09.
//  Copyright © 2016 Aaron Vegh. All rights reserved.
//

import UIKit

class INOKeyboardTextField: UITextField, UITextFieldDelegate {
    
    var activationBlock:((textField:INOKeyboardTextField) -> ())?
    
    override func awakeFromNib() {
        self.delegate = self
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

}
