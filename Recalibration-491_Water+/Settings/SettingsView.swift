//
//  SettingsView.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 3/7/24.
//

import SwiftUI
import CoreData

struct SettingsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = users.first {
                    
                    List {
                        Section(header: Text("Profile")) {
                            HStack {
                                
                                Text("Name")
                                Spacer()
                                Text(user.name!)
                            }
                            
                            HStack {
                                Text("Age")
                                Spacer()
                                Text(user.age!)
                            }
                        }
                        
                        Section(header: Text("Metrics")) {
                            HStack {
                                Text("Weight")
                                Spacer()
                                Text("\(user.weight!) lbs")
                            }
                            
                            HStack {
                                Text("Height")
                                Spacer()
                                Text("2 ft")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}


#Preview {
    SettingsView()
}
    
