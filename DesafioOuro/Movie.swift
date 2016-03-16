//
//  Movie.swift
//  DesafioOuro
//
//  Created by Student on 3/11/16.
//  Copyright © 2016 Student. All rights reserved.
//

import RealmSwift
import UIKit
import SwiftyJSON

class Movie: Object {

    dynamic var poster_path:String!
    dynamic var adult:String!
    dynamic var overview:String!
    dynamic var release_date:String!
    dynamic var genre_ids:String!
    dynamic var id:String!
    dynamic var original_title:String!
    dynamic var original_language:String!
    dynamic var title:String!
    dynamic var backdrop_path:String!
    dynamic var popularity:String!
    dynamic var vote_count:String!
    dynamic var video:String!
    dynamic var vote_average:String!

    
    
    init(withJson json: JSON){
        super.init()
        poster_path = json["poster_path"].stringValue
        adult = json["adult"].stringValue
        overview = json["overview"].stringValue
        release_date = json["release_date"].stringValue
        genre_ids = json["genre_ids"].stringValue
        id = json["id"].stringValue
        original_title = json["original_title"].stringValue
        original_language = json["original_language"].stringValue
        title = json["title"].stringValue
        backdrop_path = json["backdrop_path"].stringValue
        popularity = json["popularity"].stringValue
        vote_count = json["vote_count"].stringValue
        video = json["video"].stringValue
        vote_average = json["vote_average"].stringValue

    }
    required init() {
        super.init()
    }

}
