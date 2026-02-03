//
//  ContentView.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    var body: some View {
        ZStack {
            // MARK: Background
            
            // MARK: Content
            VStack (alignment: .leading, spacing: 15) {
                // App Name
                Text("Habit Tracker")
                
                // Slogan
                Text("Maintain your daily and ongoing schedule")
                
                // Get Started Button
                Button(
                    action: {
                        
                    },
                    label: {
                        Text("Start")
                    }
                )
            }
        }
    }
}

#Preview {
    WelcomeView()
}
