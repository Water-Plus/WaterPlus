//
//  ContentView.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    
    let persistentContainer = CoreDataManager.shared.persistenceContainer
    @StateObject var weather = WeatherServerFetchRequest()
    @StateObject var healthStore = HealthStore()
    @State private var showUserInfoStart = false
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>

    init() {
        UITabBar.appearance().unselectedItemTintColor = .black
    }
    
    var body: some View {
        
        TabView {
            HomePage()
                .tabItem {
                       Label("Home", systemImage: "list.dash")
                   }
            
            SettingsView()
                .tabItem {
                       Label("Settings", systemImage: "list.dash")
                   }
        }
        .accentColor(.white)
        .environmentObject(weather)
        .environmentObject(healthStore)
        .onAppear {
            
//            weather.find()
            
            healthStore.requestAuthorization { _ in
                
            }
            
            if isFirstLaunch {
                showUserInfoStart = true
            }
            
            
            printUserInfo()
        }
        .fullScreenCover(isPresented: $showUserInfoStart) {
            WelcomeView()
                .onAppear {
                    isFirstLaunch = false
                }
        }
    }
    
    private func printUserInfo() {
        for user in users {
            print("name: \(user.name ?? "Unknown")")
            print("Age: \(user.age)")
            print("Weight: \(user.weight)")
        }
    }
}

#Preview {
    ContentView()
}


