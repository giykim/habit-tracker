//
//  HabitButtonView.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import SwiftUI

struct HabitButtonView: View {
    @ObservedObject var viewModel: HabitButtonViewModel
    @Binding var isEditMode: Bool

    init(habit: Habit, isEditMode: Binding<Bool>) {
        viewModel = HabitButtonViewModel(habit: habit)
        self._isEditMode = isEditMode
    }
    
    var body: some View {
        Button(
            action: {
                viewModel.buttonClicked()
            },
            
            label: {
                HStack(alignment: .center, spacing: 15) {
                    // Emoji
                    Text(viewModel.habit.emoji)
                        .font(Font.system(size: 50))
                        .padding(.leading)
                    
                    // Habit Description (Title, description, streak)
                    VStack(alignment: .leading) {
                        Text(viewModel.habit.title)
                            .foregroundStyle(.orange)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Text(viewModel.habit.description)
                            .foregroundStyle(Color(.label))
                            .font(.subheadline)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Text("\(viewModel.habit.streak) day(s) Streak")
                            .foregroundStyle(Color(.label))
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    if isEditMode {
                        if !viewModel.isDeleted {
                            Button(
                                action: {
                                    viewModel.deleteHabit()
                                },
                                label: {
                                    Image(systemName: "minus.circle.fill")
                                        .font(Font.system(size: 50))
                                        .foregroundStyle(.red)
                                        .padding(.trailing)
                                }
                            )
                        }
                    } else if viewModel.habit.isComplete {
                        Image(systemName: "checkmark.circle.fill")
                            .font(Font.system(size: 50))
                            .foregroundStyle(.orange)
                            .padding(.trailing)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(15)
                .shadow(color: Color(.systemGray), radius: 3)
                .opacity(viewModel.buttonOpacity)
            }
        )
    }
}

#Preview {
    HabitButtonView(habit: DeveloperPreview.habits[0], isEditMode: .constant(true))
}
