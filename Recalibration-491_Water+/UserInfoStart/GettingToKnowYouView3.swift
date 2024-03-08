//
//  GettingToKnowYouView3.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 3/7/24.
//

import SwiftUI

struct GettingToKnowYouView3: View {
    
    @Binding var name: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var feet: String
    @Binding var inches: String
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        ZStack {
            
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment:.center, spacing: 30) {
                Text("Perfect!")
                    .font(.system(size: 46))
                    .foregroundColor(Color.white)
                
                
                Text("Your profile is complete.")
                    .font(.system(size: 20))
                    .foregroundColor(Color(UIColor.systemGray2))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                HStack {
                    Text(name)
                        .font(.system(size: 20))
                        .foregroundColor(Color(UIColor.systemGray2))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Text(age)
                        .font(.system(size: 20))
                        .foregroundColor(Color(UIColor.systemGray2))
                        .multilineTextAlignment(.center)
                    
                }
                .frame(width: 200)
                
                HStack {
                    Text("\(feet)ft  \(inches) in")
                        .font(.system(size: 20))
                        .foregroundColor(Color(UIColor.systemGray2))
                        .multilineTextAlignment(.center)
                    
                    Spacer()

                    Text("\(weight)lbs")
                        .font(.system(size: 20))
                        .foregroundColor(Color(UIColor.systemGray2))
                        .multilineTextAlignment(.center)
                    
                }
                .frame(width: 200)

                
                Button(action: {
                    UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
                    saveUserDB()
                }, label: {
                    Text("Done")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(Color("ButtonBackgroundColor"))
                        .cornerRadius(10)
                })
                
                
            }
            .padding()
        }
        
    }
    
    private func saveUserDB() {
        let newUser = User(context: viewContext)

        newUser.name = name
        newUser.age = age
        newUser.feet = feet
        newUser.inches = inches
        newUser.weight = weight
        
        
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}

//#Preview {
//    GettingToKnowYouView3()
//}
