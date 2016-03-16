//
//  MovieDetailHeaderTableViewCell.swift
//  DesafioOuro
//
//  Created by Student on 3/11/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class MovieDetailHeaderTableViewCell: MovieDetailTableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var topFadeView: UIView!
    @IBOutlet weak var bottomFadeView: UIView!
    
    // MARK: - Actions
    
    @IBAction func BackButtonTapped(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("BackButtonTapped", object: nil)
    }
    
    // MARK: - Helper Methods
    
    override func configureUI() {
        self.photoImageView.image = self.album.albumImage
        
        let topGradient: CAGradientLayer = CAGradientLayer()
        topGradient.frame = CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.size.width, 20.0)
        topGradient.colors = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5).CGColor, UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).CGColor]
        self.topFadeView.layer.insertSublayer(topGradient, atIndex: 0)
        
        let bottomGradient: CAGradientLayer = CAGradientLayer()
        bottomGradient.frame = CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.size.width, 44.0)
        bottomGradient.colors = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).CGColor, UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5).CGColor]
        self.bottomFadeView.layer.insertSublayer(bottomGradient, atIndex: 0)
    }
    
    // MARK: - Other methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
