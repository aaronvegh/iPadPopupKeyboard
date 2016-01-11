//
//  ViewController.swift
//  INOiPadPopupKeyboard
//
//  Created by Aaron Vegh on 2016-01-09.
//  Copyright © 2016 Aaron Vegh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField:INOKeyboardTextField!
    @IBOutlet var textField2:INOKeyboardTextField!
    @IBOutlet var textField3:INOKeyboardTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.viewController = self
        self.textField2.viewController = self
        self.textField3.viewController = self
    }
    
    


}

