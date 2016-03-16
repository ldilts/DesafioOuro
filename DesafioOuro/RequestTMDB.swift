//
//  RequestTMDB.swift
//  DesafioOuro
//
//  Created by Student on 3/16/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON

class RequestTMDB: NSObject {
    var movie:Movie!
    var urlRequest:String!
    var json:JSON!
    
    let realm = try! Realm()
    
    override init() {
        
    }
    
    func request(url: String?) {
        
        if let _ = url {
            urlRequest = url
            self.makeCall { (movie) ->  Void in
                    if let unwrappedMovie = movie {
                        print("\n \(unwrappedMovie) \n\n\n\n\n")
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
        let params = ["":""]
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
                print(json["results"].count)

                //print(json["results"])
                for movies in 1...json["results"].count{
                    print(movies)
                    completionHandler(Movie(withJson: json["results"][movies]))
                }
        }
    }

}
