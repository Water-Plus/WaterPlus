//
//  Recalibration_491_Water_App.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 2/27/24.
//

import SwiftUI

@main
struct Recalibration_491_Water_App: App {
    
    let persistentContainer = CoreDataManager.shared.persistenceContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)

        }
    }
}
