//
//  MovieDetailSubheaderTableViewCell.swift
//  DesafioOuro
//
//  Created by Student on 3/11/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class MovieDetailSubheaderTableViewCell: MovieDetailTableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Helper Methods
    
    override func configureUI() {
        self.titleLabel.text = self.album.titleText
        self.subtitleLabel.text = self.album.detailText
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
