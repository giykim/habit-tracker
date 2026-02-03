//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import SwiftUI

struct HabitListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            // Header
            Text("Today's tasks")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 5) {
                // Date
                Text("February 3rd, 2026")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.cyan)
                
                // List Streak
                Text("🔥 1 day(s) Streak")
                    .font(.title3)
            }
            
            // Habit List
            
            // Button
            Button(
                action: {
                    
                },

                label: {
                    HStack(alignment: .center, spacing: 15) {
                        // Emoji
                        Text("🏋️")
                            .font(Font.system(size: 50))
                            .padding(.leading)

                        // Habit Description (Title, description, streak)
                        VStack(alignment: .leading) {
                            Text("Habit Title")
                                .foregroundStyle(.orange)
                                .font(.title2)
                                .fontWeight(.semibold)

                            Text("Habit Description")
                                .foregroundStyle(Color(.label))
                                .font(.subheadline)

                            Text("1 day(s) Streak")
                                .foregroundStyle(Color(.label))
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.circle.fill")
                            .font(Font.system(size: 50))
                            .foregroundStyle(.orange)
                            .padding(.trailing)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(15)
                    .shadow(color: Color(.systemGray), radius: 3)
                }
            )
            
            // Add Habit Button
            HStack {
                Spacer()

                Button(
                    action: {
                        
                    },
                    
                    label: {
                        Image(systemName: "plus.circle.fill")
                            .font(Font.system(size: 50))
                            .foregroundColor(.orange)
                    }
                )
            }
        }
        .padding()
    }
}

#Preview {
    HabitListView()
}
