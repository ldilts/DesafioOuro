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

    dynamic var Title:String!
    dynamic var Year:String!
    dynamic var Rated:String!
    dynamic var Released:String!
    dynamic var Runtime:String!
    dynamic var Genre:String!
    dynamic var Director:String!
    dynamic var Language:String!
    dynamic var Writer:String!
    dynamic var Actors:String!
    dynamic var Plot:String!
    dynamic var Poster:String!
    dynamic var imdbRating:String!
    dynamic var imdbVotes:String!
    dynamic var imdbID:String!
    dynamic var Type:String!
    
    
    init(withJson json: JSON){
        super.init()
        Title = json["Title"].stringValue
        Year = json["Year"].stringValue
        Rated = json["Rated"].stringValue
        Released = json["Released"].stringValue
        Runtime = json["Runtime"].stringValue
        Genre = json["Genre"].stringValue
        Director = json["Director"].stringValue
        Language = json["Language"].stringValue
        Writer = json["Writer"].stringValue
        Actors = json["Actors"].stringValue
        Plot = json["Plot"].stringValue
        Poster = json["Poster"].stringValue
        imdbRating = json["imdbRating"].stringValue
        imdbVotes = json["imdbVotes"].stringValue
        imdbID = json["imdbID"].stringValue
        Type = json["Type"].stringValue

    }

    required init() {
//        fatalError("init() has not been implemented")
        super.init()
    }
    


}
