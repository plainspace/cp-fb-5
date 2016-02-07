//
//  ThrillistDetailViewController.swift
//  Facebook
//
//  Created by Jared on 2/3/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class ThrillistDetailViewController: UIViewController {
    
    @IBOutlet weak var ThrillistScrollView: UIScrollView!
    
    @IBOutlet weak var ThrillistImageView: UIImageView!
    
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var CommentBarParentView: UIView!
    
    @IBOutlet weak var TouchCommentField: UITextField!

    var initialY: CGFloat!
    var offset: CGFloat!
    
    func keyboardWillShow(notification: NSNotification!) {
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
    }
    
    
    @IBAction func BackButtonAction(sender: AnyObject) {
        // dismissViewControllerAnimated(true, completion: nil)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func LikeButton(sender: UIButton) {
        if sender.selected == false {
            sender.selected = true
        }
        else {
            sender.selected = false
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 7, self.TouchCommentField.frame.height))
        TouchCommentField.leftView = paddingView
        TouchCommentField.leftViewMode = UITextFieldViewMode.Always
        
        ThrillistScrollView.contentSize = ThrillistImageView.image!.size
        
        TouchCommentField.becomeFirstResponder()
        
        initialY = CommentBarParentView.frame.origin.y
        
        offset = -50
        
        NSNotificationCenter.defaultCenter().addObserver(self,selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object:nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self,selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object:nil)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
