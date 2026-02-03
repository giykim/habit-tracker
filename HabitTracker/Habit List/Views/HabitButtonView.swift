//
//  HabitButtonView.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import SwiftUI

struct HabitButtonView: View {
    @ObservedObject var viewModel: HabitButtonViewModel

    init(habit: Habit) {
        viewModel = HabitButtonViewModel(habit: habit)
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
                        
                        Text(viewModel.habit.description)
                            .foregroundStyle(Color(.label))
                            .font(.subheadline)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Text("\(viewModel.habit.streak) day(s) Streak")
                            .foregroundStyle(Color(.label))
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    if(viewModel.habit.isComplete) {
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
            }
        )
    }
}

#Preview {
    HabitButtonView(habit: DeveloperPreview.habits[0])
}
