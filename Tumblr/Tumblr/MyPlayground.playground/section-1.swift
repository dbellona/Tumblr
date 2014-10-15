// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



var p = CGPoint(x: 0, y: 0)

var s:CGSize = CGSize(width: 10, height: 10)

CGRect(origin: p, size: s)




// delay
func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}



delay(1, closure: { () -> () in
    println("")

    }
)


UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveLinear | .Repeat, animations: { () -> Void in
    println()
    }) { (done: Bool) -> Void in
    println()
}