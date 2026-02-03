//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import SwiftUI

struct HabitListView: View {
    @StateObject var viewModel = HabitListViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // Header
                Text("Today's tasks")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
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
                
                LazyVStack(spacing: 15) {
                    ForEach(viewModel.habits) { habit in
                        HabitButtonView(habit: habit)
                    }
                }
                
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
            Spacer()
        }
        .padding()
        .scrollClipDisabled()
    }
}

#Preview {
    HabitListView()
}
