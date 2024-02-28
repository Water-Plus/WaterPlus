//
//  HomePage.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 2/27/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ZStack {
            
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("CIRCLE")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                
                DailyLog()
                    .frame(width: UIScreen.screenWidth / 1.1)
                    
            }
        }
    }
}

#Preview {
    HomePage()
}
