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

            VStack{
                ProgressBar()
                    .frame(width: UIScreen.screenWidth / 1.1, height: UIScreen.screenHeight / 3)

                DailyLog()
                    .frame(width: UIScreen.screenWidth / 1.1)
                
                IntakeButton().frame(width:UIScreen.screenWidth/1.1)
            }
                    
            }
        }
    }

#Preview {
    HomePage()
}
