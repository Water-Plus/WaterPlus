//
//  WelcomeView.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 3/7/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var name: String = ""
    @State var age: String = ""
    @State var weight: String = ""
    @State var feet: String = ""
    @State var inches: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment:.center, spacing: 30) {
                    Text("Welcome!")
                        .font(.system(size: 46))
                        .foregroundColor(Color.white)
                    
                    
                    Text("Water+ is your personal assistant for achieving your goals and staying hydrated! ")
                        .font(.system(size: 20))
                        .foregroundColor(Color(UIColor.systemGray2))
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    
                    NavigationLink(destination: GettingToKnowYouView(name: $name, age: $age, weight: $weight, feet: $feet, inches: $inches)) {
                        Text("Get Started")
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
}

//#Preview {
//    WelcomeView(name: "", age: "", weight: "", height: "")
//}
