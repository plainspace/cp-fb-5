//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Jared on 2/3/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var NewsFeedScrollView: UIScrollView!
    @IBOutlet weak var NewsFeedImageView: UIImageView!
    @IBOutlet weak var newNewsFeedImageView: UIImageView!
    
    var selectedImageView: UIImageView!
    var isPresenting: Bool = true
    var imageTransition: ImageTransition!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsFeedScrollView.contentSize = newNewsFeedImageView.image!.size
        
        // NewsFeedScrollView.contentSize = CGSize(width: newNewsFeedImageView.frame.width, height: newNewsFeedImageView.frame.height + 64)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPhotoTap(sender: UITapGestureRecognizer) {
    
        selectedImageView = sender.view as! UIImageView
    
        performSegueWithIdentifier("photoSegue", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        activityIndicator.startAnimating()
        
        NewsFeedImageView.hidden = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        delay(2, closure: { () -> () in
            
            self.activityIndicator.stopAnimating()
            
            // self.NewsFeedImageView.fadeIn()
            self.NewsFeedImageView.hidden = false

            
        })
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        imageTransition = ImageTransition()
        imageTransition.duration = 0.2

        photoViewController.photo = selectedImageView.image
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = imageTransition
        
        photoViewController.view.layoutIfNeeded()
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
