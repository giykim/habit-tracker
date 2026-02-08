//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import SwiftUI

struct HabitListView: View {
    @StateObject var viewModel = HabitListViewModel()
    @State var showAddHabitForm = false
    @State var isEditMode: Bool = false

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
                    Text(viewModel.dateString)
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
                        HabitButtonView(habit: habit, isEditMode: $isEditMode)
                    }
                }
                
                // Add Habit Button
                HStack {
                    Spacer()
                    
                    Button(
                        action: {
                            showAddHabitForm = true
                        },
                        
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .font(Font.system(size: 50))
                                .foregroundColor(.orange)
                        }
                    )
                }

                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showAddHabitForm, onDismiss: viewModel.onAddHabitDismissed, content: {
            AddHabitView()
                .presentationDragIndicator(.visible)
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(isEditMode ? "Done" : "Edit") {
                    isEditMode.toggle()
                    viewModel.refreshHabits()
                }
            }
        }
    }
}

#Preview {
    HabitListView()
}
