//
//  GettingToKnowYouView2.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 3/7/24.
//

import SwiftUI

struct GettingToKnowYouView2: View {
    
//    @State private var selectedFeet: Int = 0

    @Binding var name: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var feet: String
    @Binding var inches: String

    
    let feetRange = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"] // Define the range of inches as strings
    let inchesRange = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"] // Define the range of inches as strings

    var body: some View {
        ZStack {
            
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment:.center, spacing: 30) {
                Text("Getting to know you.")
                    .font(.system(size: 46))
                    .foregroundColor(Color.white)
                
                
                Text("Enter your height:")
                    .font(.system(size: 20))
                    .foregroundColor(Color(UIColor.systemGray2))
                    .multilineTextAlignment(.center)
                
                HStack {
                    Picker(selection: $feet, label: Text("Feet")) {
                        ForEach(feetRange, id: \.self) { feet in
                            Text("\(feet) ft").tag(feet)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    
                    Picker(selection: $inches, label: Text("Inches")) {
                        ForEach(inchesRange, id: \.self) { inches in
                            Text("\(inches) in").tag(inches)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    .onChange(of: inches) { newVal in
                        print(newVal)
                        
                    }
                }
                .padding(.top, -50)
                
                Text("Enter your weight:")
                    .font(.system(size: 20))
                    .foregroundColor(Color(UIColor.systemGray2))
                    .multilineTextAlignment(.center)
                
                HStack {
                    TextField("Enter Weight", text: $weight)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 150)
                    
                    Text("lbs")
                }
                .padding()
                .background(Color.blue)
                .padding(.bottom)

                
                NavigationLink(destination: GettingToKnowYouView3(name: $name, age: $age, weight: $weight, feet: $feet, inches: $inches)) {
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
//    GettingToKnowYouView2()
//}
