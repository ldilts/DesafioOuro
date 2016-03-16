//
//  TableViewCell.swift
//  DesafioOuro
//
//  Created by Student on 3/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    var album: Album! {
        didSet {
            self.configureUI()
        }
    }
    
    var movie: Movie!{
        didSet{
            self.configureUIAux()
        }
    }
    
    private func configureUIAux(){
    }
    
    private func configureUI() {
        
        if let photo = self.album.albumImage {
            self.photoImageView.image = photo
            self.backgroundImageView.image = photo
        }
        
        if let title = self.album.titleText {
            self.titleLabel.text = title
        }
        
        if let detail = self.album.detailText {
            self.detailLabel.text = detail
        }
        
        let image: UIImage = (self.album.isLiked ? UIImage(named: "Like On Icon") : UIImage(named: "Like Off Icon"))!
        
        likeButton.setImage(image, forState: UIControlState.Normal)
    }
    
    @IBAction func likeButtonTapped(sender: UIButton) {
        
        self.album.isLiked = !self.album.isLiked
        
        let image: UIImage = (self.album.isLiked ? UIImage(named: "Like On Icon") : UIImage(named: "Like Off Icon"))!
        
        likeButton.setImage(image, forState: UIControlState.Normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
