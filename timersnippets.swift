//create 1 sec timer:
  var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTick"), userInfo: nil, repeats: true)
