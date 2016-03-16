//
//  MovieDetailOverviewTableViewCell.swift
//  DesafioOuro
//
//  Created by Student on 3/16/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class MovieDetailOverviewTableViewCell: MovieDetailTableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    
    // MARK: - Helper Methods
    
    override func configureUI() {
        self.overviewLabel.text = self.album.titleText
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
