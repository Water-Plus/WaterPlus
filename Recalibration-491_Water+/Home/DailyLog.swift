//
//  DailyLog.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 2/27/24.
//

import SwiftUI

struct DailyLog: View {
    var body: some View {
        VStack {
            Text("Daily Log")
            
            HStack {
                Text("250ml")
                Spacer()
                Text("8:30 AM")
            }
            .padding()
        
            
            Rectangle()
                .foregroundColor(.black)
                .frame(width: 360, height: 5, alignment: .center)
            
            HStack {
                Text("250ml")
                Spacer()
                Text("8:30 AM")
            }
            .padding()
        
            
            Rectangle()
                .foregroundColor(.black)
                .frame(width: 360, height: 5, alignment: .center)
            
            HStack {
                Text("250ml")
                Spacer()
                Text("8:30 AM")
            }
            .padding()
        
            
            Rectangle()
                .foregroundColor(.black)
                .frame(width: 360, height: 5, alignment: .center)
            
            HStack {
                Text("250ml")
                Spacer()
                Text("8:30 AM")
            }
            .padding()
        
            
            Rectangle()
                .foregroundColor(.black)
                .frame(width: 360, height: 5, alignment: .center)
            
        }
    }
}

#Preview {
    DailyLog()
}
