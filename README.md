# iPadPopupKeyboard
A mini popup keyboard for iPad apps

I know, this is a little weird. It may even be bad human interface design, and you may get mocked for even reading this page.

BUT. I've been noodling this idea for years: when editing small bits of text on the iPad, it feels cumbersome to change context from the text label to a giant-ass keyboard that slides up from the bottom of the screen! With a popover keyboard that was similar in size to the iPhone keyboard, you could stay in-context with the textfield you're editing, and it would feel faster.

iPadPopupKeyboard is my attempt to prove the idea has merit. I'm using it in an app I'm developing, but I want to share it with the world in case anyone else finds it interesting.

Here's what it looks like:
<img src="http://vegh.ca/iPadPopupKeyboard.png" />

##How to Use  
This repo is a demo app that contains the code you need. You can run the demo app and include it in your project by copying these files:

* INOKeyboardTextField.swift
* INOKeyboardViewController.swift
* INOKeyboardButton.swift
* INOKeyboardViewController.xib

In Interface Builder, drop a `UITextField` onto your view, and give it a custom classname, `INOKeyboardTextField`.

In your view controller, connect the button to an `@IBOutlet` and then, in the `viewDidLoad:` method, assign the controller to the property:

```
self.textField.viewController = self
```

That's it!

##Why is this a bad idea?  
Well... it's not a standard UIKit component. It lacks basic accessibility features. It only supports Roman languages. I did this as much as a proof of concept as something that you want to use in a production app. I think it's cool, and if you do too, maybe you'd consider helping add those missing features? Why not.

