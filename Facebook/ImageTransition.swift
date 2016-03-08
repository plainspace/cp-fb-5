//
//  ImageTransition.swift
//  Facebook
//
//  Created by Jared on 3/4/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
    
        // cast away
        let tabBarViewController = fromViewController as! UITabBarController
        let navigationController = tabBarViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        let window = UIApplication.sharedApplication().keyWindow
        let movingImageFrame = window!.convertRect(newsFeedViewController.selectedImageView.frame, fromView: newsFeedViewController.NewsFeedScrollView)
        
        print(movingImageFrame) // image frame coordinates
        
        movingImageView.frame = movingImageFrame
        movingImageView.image = newsFeedViewController.selectedImageView.image
        movingImageView.clipsToBounds = photoViewController.photoImageView.clipsToBounds
        movingImageView.contentMode = photoViewController.photoImageView.contentMode
        
        containerView.addSubview(movingImageView)
        newsFeedViewController.selectedImageView.alpha = 0
        toViewController.view.alpha = 0
        photoViewController.photoImageView.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            photoViewController.photoImageView.alpha = 0
            movingImageView.frame = photoViewController.photoImageView.frame
            // movingImageView.contentMode = UIViewContentMode.ScaleAspectFit
            
            }) { (finished: Bool) -> Void in
                photoViewController.photoImageView.alpha = 1
                newsFeedViewController.selectedImageView.alpha = 1
                movingImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        // cast away
        let tabBarViewController = toViewController as! UITabBarController
        let navigationController = tabBarViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController

        let movingImageView = UIImageView()
        let window = UIApplication.sharedApplication().keyWindow
        let movingImageFrame = window!.convertRect(newsFeedViewController.selectedImageView.frame, fromView: newsFeedViewController.NewsFeedScrollView)
        var initialImageFrame = window!.convertRect(photoViewController.photoImageView.frame, fromView: photoViewController.view)
        let offset = photoViewController.scrollView.contentOffset.y
        
        
        movingImageView.frame.origin.x = photoViewController.photoImageView.frame.origin.x
        movingImageView.frame.origin.y = photoViewController.photoImageView.frame.origin.y - offset
        movingImageView.frame.size.height = photoViewController.photoImageView.frame.size.height
        movingImageView.frame.size.width = photoViewController.photoImageView.frame.size.width
        
        
        movingImageView.image = photoViewController.photoImageView.image
        movingImageView.clipsToBounds = photoViewController.photoImageView.clipsToBounds
        movingImageView.contentMode = photoViewController.photoImageView.contentMode
        
        containerView.addSubview(movingImageView)
        photoViewController.photoImageView.alpha = 0
        newsFeedViewController.selectedImageView.alpha = 0
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            newsFeedViewController.selectedImageView.alpha = 0
            movingImageView.frame = movingImageFrame
            
            }) { (finished: Bool) -> Void in
                photoViewController.photoImageView.alpha = 1
                newsFeedViewController.selectedImageView.alpha = 1
                movingImageView.removeFromSuperview()
                self.finish()
        }
    }
}
