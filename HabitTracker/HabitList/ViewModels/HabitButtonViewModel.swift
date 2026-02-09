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
    
    init(habit: Habit) {
        self.habit = habit
        validateStreak()
    }
}

// MARK: Delete Functionality
extension HabitButtonViewModel {
    func deleteHabit() {
        HabitService.shared.deleteHabbit(habit)
        isDeleted = true
    }
}

// MARK: Streak Functionality
extension HabitButtonViewModel {
    func buttonClicked() {
        if (!isLastDateSameAsToday()) {
            increaseStreak()
        }
    }
    
    func increaseStreak() {
        habit.lastDateDone = Date()
        habit.streak += 1
        HabitService.shared.updateHabit(forHabit: habit)
    }
    
    func validateStreak() {
        guard let lastDateDone = habit.lastDateDone else { return }
        
        let calendar = Calendar(identifier: .iso8601)
        
        if (calendar.numberOfDaysBetween(lastDateDone, and: Date()) > 2) {
            habit.streak = 0
            HabitService.shared.updateHabit(forHabit: habit)
        }
    }
    
    func isLastDateSameAsToday() -> Bool {
        if (habit.lastDateDone != nil) {
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .short
            
            let today = formatter.string(from: Date())
            let lastDateDone = formatter.string(from: habit.lastDateDone!)
            
            return today == lastDateDone
        }
        
        return false
    }
}
