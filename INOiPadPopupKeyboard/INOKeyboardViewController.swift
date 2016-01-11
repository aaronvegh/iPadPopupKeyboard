//
//  INOKeyboardViewController.swift
//  INOiPadPopupKeyboard
//
//  Created by Aaron Vegh on 2016-01-09.
//  Copyright © 2016 Aaron Vegh. All rights reserved.
//

import UIKit

class INOKeyboardViewController:UIViewController {
    
    @IBOutlet var buttonCollection:[INOKeyboardButton]!
    var textEnteredBlock:((value:String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in self.buttonCollection {
            button.buttonTappedHandler = { (value:String) in
                if value == "^" {
                    let _ = self.buttonCollection.map({$0.isShifted = true})
                }
                else if value == "Backspace" {
                    
                }
                else {
                    print("Value: \(value)")
                    let _ = self.buttonCollection.map({$0.isShifted = false})
                    if let textBlock = self.textEnteredBlock {
                        textBlock(value:value)
                    }
                }
            }
            
        }
    }
    
}
