// add notification for event
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldChangedSelector:",
            name: "UITextFieldTextDidChangeNotification", object: nil)

//implement selector:
    
    func textFieldChangedSelector(sender: AnyObject){
    }
