//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by David Bellona on 10/11/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var trendingView: UIImageView!
    @IBOutlet weak var loaderImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scroll
        scrollView.delegate = self
        scrollView.contentSize = trendingView.frame.size
        scrollView.sendSubviewToBack(trendingView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewWillAppear(animated: Bool) {
        scrollView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        attachLoader()
        UIView.animateWithDuration(0.25, delay: 0.5, options: nil, animations: { () -> Void in
            self.scrollView.alpha = 1
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
        var images = UIImage.animatedImageNamed("loading-", duration: 1)
        loaderImage.image = images
    }



}
