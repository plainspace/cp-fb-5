//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Jared on 3/3/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var actionButtons: UIImageView!
    
    var photo: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        photoImageView.clipsToBounds = true
        
        photoImageView.image = photo

        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        scrollView.contentSize = CGSize(width: 320, height: 800)
        
//        self.scrollView.minimumZoomScale = 1.0
//
//        self.scrollView.maximumZoomScale = 6.0
    }
    
    @IBAction func didTapDone(sender: AnyObject) {
    
        dismissViewControllerAnimated(true, completion: { () -> Void in
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true;
    }
    
    // scrolling 
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        let alpha = 1 - (abs(scrollView.contentOffset.y) / scrollView.frame.height) * 2
//        let offset = Float(abs(scrollView.contentOffset.y))
//        let alpha = CGFloat(1 - (offset * 1.25 / 100))
        self.view.backgroundColor = UIColor(white: 0, alpha: alpha)
        
        if abs(scrollView.contentOffset.y) > 100 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        UIView.animateWithDuration(0.1){
            self.actionButtons.alpha = 0
            self.doneButton.alpha = 0
        }
        
    }

//    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if scrollView.contentOffset.y < -40 || scrollView.contentOffset.y > 40 {
//
//            dismissViewControllerAnimated(true, completion: nil)
//            // scrollView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
//
//        } else {
//            self.doneButton.alpha = 1
//            self.actionButtons.alpha = 1
//        }
//        
//    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            if abs(scrollView.contentOffset.y) < 40 {
                UIView.animateKeyframesWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
                    self.actionButtons.alpha = 1
                    self.doneButton.alpha = 1
                    }, completion: nil)
            } else {
                dismissViewControllerAnimated(true, completion: nil)
            }
            
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        UIView.animateKeyframesWithDuration(0.1, delay: 0, options: [], animations: { () -> Void in
            
            }, completion: nil)
    }
    
    
    // zooming
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.photoImageView
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        
        if abs(scrollView.contentOffset.y) > 0 {
            self.view.backgroundColor = UIColor(white: 0, alpha: 1)
            dismissViewControllerAnimated(false, completion: nil)
        }
        
        self.doneButton.alpha = 0
        self.actionButtons.alpha = 0
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        if scale == 1 {
            self.doneButton.alpha = 1
            self.actionButtons.alpha = 1
        } else {
        }
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
