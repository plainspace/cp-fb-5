//
//  LoginViewController.swift
//  Facebook
//
//  Created by Jared on 2/9/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var LogoView: UIImageView!
    
    @IBOutlet weak var FieldParentView: UIView!
    
    @IBOutlet weak var LabelParentView: UIView!
    
    @IBAction func DidTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY = FieldParentView.frame.origin.y
        offset = -50
        // let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        FieldParentView.frame.origin.y = initialY + offset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        FieldParentView.frame.origin.y = initialY
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func OnButtonPress(sender: AnyObject) {
        self.ActivityIndicator.startAnimating()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
