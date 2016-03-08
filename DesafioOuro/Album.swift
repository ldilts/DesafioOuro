//
//  Album.swift
//  DesafioOuro
//
//  Created by Student on 3/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class Album: NSObject {
    
    var albumImage: UIImage!
    var titleText: String!
    var detailText: String!
    
    var isLiked: Bool = false
    
    init(withImage image: UIImage, andTitle title: String, andDetail detail: String) {
        
        self.albumImage = image
        self.titleText = title
        self.detailText = detail
        
        super.init()
    }

}
