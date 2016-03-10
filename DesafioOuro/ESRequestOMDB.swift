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


class ESRequestOMDB {
    
    var filmeDictionary:NSDictionary!
    var urlRequest:String!
    
    func request(url: String) ->NSDictionary{
        urlRequest = url
        
        makeCall() {
            (result: (NSDictionary?, NSError?)) in
            
            let api = ESRequestOMDB()
            api.getOrders() { responseObject, error in
                // use responseObject and error here
                self.filmeDictionary = responseObject
                return
            }
        }
     
        let filme:Filme = Filme()
        
        filme.Title = (filmeDictionary.valueForKey("Title") as! String)
        filme.Year  = (filmeDictionary.valueForKey("Year") as! String)
        filme.Rated = (filmeDictionary.valueForKey("Rated") as! String)
        filme.Released = (filmeDictionary.valueForKey("Released") as! String)
        filme.Runtime = (filmeDictionary.valueForKey("Runtime") as! String)
        filme.Genre = (filmeDictionary.valueForKey("Genre") as! String)
        filme.Writer = (filmeDictionary.valueForKey("Writer") as! String)
        filme.Actors = (filmeDictionary.valueForKey("Actors") as! String)
        filme.Plot = (filmeDictionary.valueForKey("Plot") as! String)
        filme.Language = (filmeDictionary.valueForKey("Language") as! String)
        filme.Poster = (filmeDictionary.valueForKey("Poster") as! String)
        filme.imdbID = (filmeDictionary.valueForKey("imdbID") as! String)
        filme.Type = (filmeDictionary.valueForKey("movie") as! String)
        
        let realm = try! Realm()

        try! realm.write {
            realm.add(filme)
        }

        
        return filmeDictionary
    
    }

    
    func getOrders(completionHandler: (NSDictionary?, NSError?) -> ()) {
        makeCall(completionHandler)
    }
    
    func makeCall(completionHandler: (NSDictionary?, NSError?) -> ()) {
        let params = ["consumer_key":"key", "consumer_secret":"secret"]
        
        Alamofire.request(.GET, urlRequest, parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    completionHandler(value as? NSDictionary, nil)
                case .Failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
}