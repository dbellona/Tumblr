//
//  SearchViewController.swift
//  Tumblr
//
//  Created by David Bellona on 10/11/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchImage: UIImageView!
    
    //var imageView:UIImageView!
    
    @IBOutlet weak var loaderImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        searchImage.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        attachLoader()
        UIView.animateWithDuration(0.25, delay: 0.5, options: nil, animations: { () -> Void in
            self.searchImage.alpha = 1
            }) { (loaded: Bool) -> Void in
                self.loaderImage.stopAnimating()
        }
    }
    
    
    // delay
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    // loader
    func attachLoader() {
        var p = CGPoint(x: view.center.x - 30.5, y: view.center.y - 9.5)
        var s = CGSize(width: 61, height: 19)
        //loaderImage = UIImageView(frame: CGRect(origin: p, size: s))
        var images = UIImage.animatedImageNamed("loading-", duration: 1)
        loaderImage.image = images
        //view.addSubview(imageView)
        
        
        
    }
    
//    func removeLoader() {
//        UIView.animateWithDuration(0.1, animations: { () -> Void in
//            self.imageView.alpha = 0
//            }) { (unload: Bool) -> Void in
//             self.imageView.removeFromSuperview()
//        }
//    }

}
