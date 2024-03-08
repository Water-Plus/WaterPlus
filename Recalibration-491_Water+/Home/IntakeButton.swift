//
//  IntakeButton.swift
//  Recalibration-491_Water+
//
//  Created by Valentyna Shyyan on 3/6/24.
//

import SwiftUI

struct IntakeButton : View{
    var body: some View{
        VStack{
            Spacer()
            Button{
                //add action
            } label: {
                
                Text("Add water intake")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .background(Color.black)
                    .cornerRadius(15)
            }.padding()
        }
    }
}

#Preview {
    IntakeButton()
}
