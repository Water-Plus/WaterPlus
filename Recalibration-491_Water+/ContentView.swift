//
//  ContentView.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            HomePage()
                .tabItem {
                       Label("Home", systemImage: "list.dash")
                   }
        }

        //        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
