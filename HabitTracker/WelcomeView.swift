//
//  WelcomeView.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            // MARK: Background
            ZStack {
                Circle()
                    .foregroundStyle(.cyan)
                    .frame(width: screenWidth / 1.3)
                    .offset(
                        x: -screenWidth / 2,
                        y: -screenHeight / 2
                    )

                Circle()
                    .foregroundStyle(.green)
                    .frame(width: screenWidth / 1.1)
                    .offset(
                        x: screenWidth / 3,
                        y: screenHeight / 3
                    )
                
                Circle()
                    .foregroundStyle(.yellow)
                    .frame(width: screenWidth / 1.8)
                    .offset(
                        x: screenWidth / 4,
                        y: -screenHeight / 4
                    )
            }
            
            // MARK: Content
            VStack(alignment: .leading, spacing: 15) {
                // App Name
                Text("HABIT TRACKER")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                // Slogan
                Text("Maintain your daily habits and long-term goals")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                // Get Started Button
                Button(
                    action: {
                        
                    },

                    label: {
                        Text("Start")
                            .foregroundStyle(.white)
                            .padding()
                            .fontWeight(.bold)
                            .background(.orange)
                            .cornerRadius(10)
                    }
                )
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
