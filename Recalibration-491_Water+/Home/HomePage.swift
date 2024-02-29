//
//  HomePage.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 2/27/24.
//

import SwiftUI

struct HomePage: View {
    @State private var progress: CGFloat = 0.2
    
    struct CircularProgressView: View {
        let progress: CGFloat
        
        var body: some View{
            ZStack{
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.1)
                    .foregroundColor(.blue)
                Text("\(progress * 100, specifier: "%.1f")")
                
                Circle()
                    .trim(from: 0.0, to: min(progress, 1.0))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: progress)
                
            }
        }
    }
    var body: some View {
        ZStack {
            
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                CircularProgressView(progress: progress)
                    .frame(width: 200, height: 200)
                    
                                
                //remove this and make value change progress with water goal - input water intake so far. Needs intake algorithm
                Slider(value: $progress, in: 0 ... 1)
                    .padding()

                DailyLog()
                    .frame(width: UIScreen.screenWidth / 1.1)
                    
            }
        }
    }
}

#Preview {
    HomePage()
}
