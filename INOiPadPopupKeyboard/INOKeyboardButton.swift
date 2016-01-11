//
//  INOKeyboardButton.swift
//  INOiPadPopupKeyboard
//
//  Created by Aaron Vegh on 2016-01-09.
//  Copyright © 2016 Aaron Vegh. All rights reserved.
//

import UIKit

class INOKeyboardButton:UIControl {
    
    let primeColour:UIColor = UIColor(white: 0, alpha: 0.65)
    let pressedColour:UIColor = UIColor(white: 0, alpha: 0.35)
    
    var buttonTappedHandler:((value:String) -> ())?
    
    var isShifted:Bool = false {
        didSet {
            self.drawKeycaps()
        }
    }
    
    @IBInspectable var primeValue:String?
    @IBInspectable var shiftedValue:String?
    
    @IBOutlet var keyCapField:UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 4
        self.addTarget(self, action: "tappedButton:", forControlEvents: .TouchDown)
        self.addTarget(self, action: "releasedButton:", forControlEvents: .TouchUpInside)
    }
    
    func drawKeycaps() {
        if self.isShifted == false {
            self.keyCapField?.text = self.primeValue
            self.accessibilityLabel = self.primeValue
            self.backgroundColor = self.primeColour
        }
        else {
            self.keyCapField?.text = self.shiftedValue
            self.accessibilityLabel = self.shiftedValue
            if self.primeValue == "^" {
                self.backgroundColor = self.pressedColour
            }
        }
    }
    
    func tappedButton(sender:INOKeyboardButton) {
        sender.backgroundColor = self.pressedColour
        print("pressed")
        if let handler = self.buttonTappedHandler {
            if self.isShifted == false {
                handler(value: self.primeValue!)
            }
            else {
                handler(value: self.shiftedValue!)
            }
        }
        self.isShifted = false

    }
    
    func releasedButton(sender:INOKeyboardButton) {
        print("released")
        if self.primeValue == "^" {
            sender.backgroundColor = self.pressedColour
        }
        else {
            sender.backgroundColor = self.primeColour
        }
    }
    
    
    
}
