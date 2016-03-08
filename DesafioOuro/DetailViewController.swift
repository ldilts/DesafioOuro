//
//  DetailViewController.swift
//  DesafioOuro
//
//  Created by Student on 3/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var statusBarBackgroundView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var photoBottomFade: UIView!
    
    var album: Album!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let _ = self.album {
            
            if let photo = self.album.albumImage {
                self.photoImageView.image = photo
            }
            
            if let title = self.album.titleText {
                self.titleLabel.text = title
            }
            
            if let detail = self.album.detailText {
                self.detailLabel.text = detail
            }
            
        }
        
        //UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        let topGradient: CAGradientLayer = CAGradientLayer()
        topGradient.frame = CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.size.width, 20.0)
        topGradient.colors = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5).CGColor, UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).CGColor]
        self.statusBarBackgroundView.layer.insertSublayer(topGradient, atIndex: 0)
        
        let bottomGradient: CAGradientLayer = CAGradientLayer()
        bottomGradient.frame = CGRectMake(0.0, UIScreen.mainScreen().bounds.size.width - 44.0, UIScreen.mainScreen().bounds.size.width, 44.0)
        bottomGradient.colors = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).CGColor, UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5).CGColor]
        self.photoBottomFade.layer.insertSublayer(bottomGradient, atIndex: 0)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
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
