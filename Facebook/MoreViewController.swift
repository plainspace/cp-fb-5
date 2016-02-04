//
//  MoreViewController.swift
//  Facebook
//
//  Created by Jared on 2/3/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var MoreScrollView: UIScrollView!
    
    @IBOutlet weak var SettingsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MoreScrollView.contentSize = SettingsImageView.image!.size
        
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
