//
//  HabitButtonViewModel.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import Foundation

class HabitButtonViewModel: ObservableObject {
    @Published var habit: Habit
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    func buttonClicked() {
        habit.isComplete.toggle()
        
        if(habit.isComplete) {
            habit.streak += 1
        } else {
            habit.streak -= 1
        }
    }
}
