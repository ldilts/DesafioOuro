//
//  MovieDetailTableViewCell.swift
//  DesafioOuro
//
//  Created by Student on 3/11/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {
    
    var album: Album! {
        didSet {
            self.configureUI()
        }
    }
    
    // MARK: - Helper Methods
    
    func configureUI() {
        print("\n\n     Do nothing\n\n")
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
