//
//  CloudKitHelper.swift
//  DesafioOuro
//
//  Created by Student on 3/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import CloudKit

class CloudKitHelper {
    
    var container : CKContainer
    var publicDB : CKDatabase
    let privateDB : CKDatabase
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    func getMovie(withId id: String) {
    }
    
//    func saveRecord(todo : NSString) {
//        let todoRecord = CKRecord(recordType: "Todos")
//        todoRecord.setValue(todo, forKey: "todotext")
//        publicDB.saveRecord(todoRecord, completionHandler: { (record, error) -&gt; void in
//            NSLog("Saved to cloud kit")
//            
//        })
//        
//    }

}
