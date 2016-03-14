//
//  ESRequestOMDB.swift
//  DesafioOuro
//
//  Created by Student on 3/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON


class ESRequestOMDB {
    
    var movie:Movie!
    var urlRequest:String!
    var json:JSON!
    
    let realm = try! Realm()
    
    init() {
        
    }
    
    func request(url: String?) {
        
        if let _ = url {
            urlRequest = url
        
            self.makeCall { (movie) ->  Void in
                if let unwrappedMovie = movie {
                    try! self.realm.write {
                        self.realm.add(unwrappedMovie)
                    }
                    
                    self.movie = unwrappedMovie
                    NSNotificationCenter.defaultCenter().postNotificationName("MovieFetched", object: nil)
                }
            }
        }
    }
    
    
    func makeCall(completionHandler: (Movie?) -> ()) {
        let params = ["consumer_key":"key", "consumer_secret":"secret"]
        Alamofire.request(.GET, urlRequest, parameters: params)
            .validate()
            .responseJSON { (response) in
                
                guard response.result.isSuccess else{
                    completionHandler(nil)
                    return
                }
                
                guard let _ = response.result.value as? [String : AnyObject] else{
                    completionHandler(nil)
                    return
                }
                
                let json = JSON(response.result.value!)
                print(json)

                completionHandler(Movie(withJson: json))
        }
    }
    
}