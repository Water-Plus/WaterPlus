//
//  ProgressBar.swift
//  Recalibration-491_Water+
//
//  Created by Douglas Villalobos on 2/29/24.
//

import SwiftUI

//test

struct ProgressBar: View {
    @State private var progress: CGFloat = 0.2
    
    struct CircularProgressView: View {
        let progress : CGFloat
        
        var body: some View {
            
            VStack{
                HStack{
                    Text("Water Intake Goal:").font(.system(size: 17))
                    Spacer()
                    Text("##").font(.system(size:17))
                }
                .padding()
                ZStack{
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.1)
                        .foregroundColor(.black)
                    Text("\(progress * 100, specifier: "%.1f")%")
                    
                    Circle()
                        .trim(from: 0.0, to: min(progress, 1.0))
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.blue)
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear, value: progress)
                }
                HStack{
                    Text("Remaining:").font(.system(size:17))
                    Spacer()
                    Text("####").font(.system(size:17))
                    
                }
            }
        }
    }
    var body: some View {
        ZStack{
            Color.blue.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                CircularProgressView(progress: progress)
                    .frame(width: 200, height: 200)
                
                //just for testing purposes, will be adjusting using goal number progress number taken from input
                Slider(value: $progress, in: 0 ... 1)
                    .padding()
            }
        }
    }
}


#Preview {
    ProgressBar()
}
