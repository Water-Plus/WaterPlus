//
//  GettingToKnowYouView.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 3/7/24.
//

import SwiftUI

struct GettingToKnowYouView: View {
    
    @Binding var name: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var feet: String
    @Binding var inches: String
    
    var body: some View {
        ZStack {
            
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment:.center, spacing: 30) {
                Text("Getting to know you.")
                    .font(.system(size: 46))
                    .foregroundColor(Color.white)
                
                
                Text("Let’s get familiar. What's your name?")
                    .font(.system(size: 20))
                    .foregroundColor(Color(UIColor.systemGray2))
                    .multilineTextAlignment(.center)
                
                TextField("Enter Name", text: $name)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.blue)
                    .padding(.bottom)
                
                
                NavigationLink(destination: GettingToKnowYouView2(name: $name, age: $age, weight: $weight, feet: $feet, inches: $inches)) {
                    Text("Continue")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(Color("ButtonBackgroundColor"))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        
    }
    

}

//#Preview {
//    GettingToKnowYouView()
//}
