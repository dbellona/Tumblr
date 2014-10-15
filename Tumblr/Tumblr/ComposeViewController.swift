//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by David Bellona on 10/11/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!

//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        modalPresentationStyle = UIModalPresentationStyle.Custom
//        transitioningDelegate = self
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 48/255, green: 70/255, blue: 92/255, alpha: 0.9)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func onTapNevermindButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
