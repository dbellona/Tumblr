//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by David Bellona on 10/11/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var explorePopupImage: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    var homeViewController:UIViewController!
    var searchiewController:UIViewController!
    var accountViewController:UIViewController!
    var trendingViewController:UIViewController!
    
    var isPresenting: Bool = true
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchiewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        UIView.animateWithDuration(0.7, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            self.explorePopupImage.frame.origin.y = 460
            }) { (finished: Bool) -> Void in
                println("loaded")
        }
        
        onTapTabBarButton(homeButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.25
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
            println("animating transition")
            var containerView = transitionContext.containerView()
            var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
            var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
            if (isPresenting) {
                containerView.addSubview(toViewController.view)
                toViewController.view.alpha = 0
                
                // set buttons in the compsoe view
                if let vc = toViewController as? ComposeViewController {
                    vc.textButton.frame.origin.y = 440
                    vc.photoButton.frame.origin.y = 440
                    vc.quoteButton.frame.origin.y = 440
                    vc.linkButton.frame.origin.y = 575
                    vc.chatButton.frame.origin.y = 575
                    vc.videoButton.frame.origin.y = 575
                }
                
                // first
                UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    if let vc = toViewController as? ComposeViewController {
                        vc.photoButton.frame.origin.y = 140
                    }
                    }, completion: nil)
                
                // second
                UIView.animateWithDuration(0.25, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    if let vc = toViewController as? ComposeViewController {
                        vc.quoteButton.frame.origin.y = 140
                        vc.chatButton.frame.origin.y = 275
                        vc.textButton.frame.origin.y = 140
                    }
                    }, completion: nil)
                
                // third
                UIView.animateWithDuration(0.25, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    if let vc = toViewController as? ComposeViewController {
                        vc.linkButton.frame.origin.y = 275
                        vc.videoButton.frame.origin.y = 275
                    }
                    }) { (finished: Bool) -> Void in
                        transitionContext.completeTransition(true)
                }
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    toViewController.view.alpha = 1
                    }, completion: nil)
                
            } else {
                // first
                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    if let vc = fromViewController as? ComposeViewController {
                        vc.photoButton.frame.origin.y = -230
                    }
                    }, completion: nil)
                
                // second
                UIView.animateWithDuration(0.2, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    if let vc = fromViewController as? ComposeViewController {
                        vc.quoteButton.frame.origin.y = -230
                        vc.chatButton.frame.origin.y = -100
                        vc.textButton.frame.origin.y = -230
                    }
                    }, completion: nil)
                
                // third
                UIView.animateWithDuration(0.2, delay: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    if let vc = fromViewController as? ComposeViewController {
                        vc.linkButton.frame.origin.y = -100
                        vc.videoButton.frame.origin.y = -100
                    }
                    }) { (finished: Bool) -> Void in
                        UIView.animateWithDuration(0.25, animations: { () -> Void in
                            fromViewController.view.alpha = 0
                            }) { (finished: Bool) -> Void in
                                transitionContext.completeTransition(true)
                                fromViewController.view.removeFromSuperview()
                        }
                }
            }
    }

    
    @IBAction func onTapTabBarButton(sender: UIButton) {
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        sender.selected = true
        
        switch sender.tag {
            
        // home
        case 0:
            searchiewController.view.removeFromSuperview()
            trendingViewController.view.removeFromSuperview()
            
            
            
            contentView.addSubview(homeViewController.view)
            homeViewController.view.frame = contentView.frame
            
            self.addChildViewController(homeViewController)
            homeViewController.didMoveToParentViewController(self)
            
            
           
            if explorePopupImage.alpha == 0 {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.explorePopupImage.alpha = 1
                }, completion: nil)
            }
            
        // search
        case 1:
            trendingViewController.view.removeFromSuperview()
            contentView.addSubview(searchiewController.view)
            searchiewController.view.frame = contentView.frame
            self.addChildViewController(searchiewController)
            searchiewController.didMoveToParentViewController(self)
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.explorePopupImage.alpha = 0
            }, completion: nil)
        // account
        case 2:
            searchiewController.view.removeFromSuperview()
            trendingViewController.view.removeFromSuperview()
            contentView.addSubview(accountViewController.view)
            accountViewController.view.frame = contentView.frame
            self.addChildViewController(accountViewController)
            accountViewController.didMoveToParentViewController(self)
            
            if explorePopupImage.alpha == 0 {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.explorePopupImage.alpha = 1
                    }, completion: nil)
            }
        //trending
        case 3:
            searchiewController.view.removeFromSuperview()
            contentView.addSubview(trendingViewController.view)
            trendingViewController.view.frame = contentView.frame
            self.addChildViewController(trendingViewController)
            trendingViewController.didMoveToParentViewController(self)
            
            if explorePopupImage.alpha == 0 {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.explorePopupImage.alpha = 1
                    }, completion: nil)
            }
        default:
            println(sender)
        }
    }
    
    
    @IBAction func onTapCompose(sender: AnyObject) {
        performSegueWithIdentifier("composeSegue", sender: self)
    }
}
