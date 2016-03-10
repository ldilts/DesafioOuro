//
//  DetailTitleTableViewCell.swift
//  DesafioOuro
//
//  Created by Student on 3/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {
    
    var album: Album! {
        didSet {
//            self.configureUI()
        }
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
