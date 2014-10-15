//
//  LoginViewController.swift
//  Tumblr
//
//  Created by David Bellona on 10/12/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 48/255, green: 70/255, blue: 92/255, alpha: 0.9)
        emailTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    @IBAction func onTapCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        view.endEditing(true)
    }
}
