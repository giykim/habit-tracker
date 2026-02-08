//
//  HabitButtonViewModel.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import Foundation

class HabitButtonViewModel: ObservableObject {
    @Published var habit: Habit
    @Published var isDeleted: Bool = false
    @Published var buttonOpacity: Double = 1.0
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    func buttonClicked() {
        habit.isComplete.toggle()
        
        if habit.isComplete {
            habit.streak += 1
        } else {
            habit.streak -= 1
        }
    }
    
    func deleteHabit() {
        HabitService.shared.deleteHabbit(habit)
        isDeleted = true
        buttonOpacity = 0.3
    }
}
