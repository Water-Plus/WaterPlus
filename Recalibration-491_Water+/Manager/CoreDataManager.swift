//
//  CoreDataManager.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 3/7/24.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager {
    
    let persistenceContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()

    
     private init() {
        
        persistenceContainer = NSPersistentContainer(name: "WaterDB")
        persistenceContainer.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }

    }
}
