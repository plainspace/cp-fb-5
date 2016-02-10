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
    
    @IBOutlet weak var SignUpLink: UILabel!
    
    @IBAction func DidTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    var initialYLogoView: CGFloat!
    var offsetLogoView: CGFloat!
    
    var initialYFieldParentView: CGFloat!
    var offsetFieldParentView: CGFloat!
    
    var initialYLabelParentView: CGFloat!
    var offsetLabelParentView: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialYLogoView = LogoView.frame.origin.y
        offsetLogoView = -34
        
        initialYFieldParentView = FieldParentView.frame.origin.y
        offsetFieldParentView = -70
        
        initialYLabelParentView = LabelParentView.frame.origin.y
        offsetLabelParentView = -234
        
        // let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        LogoView.frame.origin.y = initialYLogoView + offsetLogoView

        FieldParentView.frame.origin.y = initialYFieldParentView + offsetFieldParentView

        LabelParentView.frame.origin.y = initialYLabelParentView + offsetLabelParentView
        
        SignUpLink.hidden = true
        
        print("move parent views up")

    }
    
    func keyboardWillHide(notification: NSNotification!) {
        LogoView.frame.origin.y = initialYLogoView

        FieldParentView.frame.origin.y = initialYFieldParentView

        LabelParentView.frame.origin.y = initialYLabelParentView
        
        SignUpLink.hidden = false
        
        print("move parent views down")

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
