//
//  HabitService.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/7/26.
//

import Foundation
import SwiftUI

class HabitService {
    @AppStorage("HABITS_KEY") var savedHabits: Data = Data()
    private var habits: [Habit] = []
    
    static let shared = HabitService()
    
    init() {
        habits = retrieveHabits()
    }
}

// MARK: Data Conversion
extension HabitService {
    // Save
    func saveHabits() {
        // Convert to JSON
        guard let habitsJSON = try? JSONEncoder().encode(habits) else { return }
        
        self.savedHabits = habitsJSON
    }

    // Retrieve
    func retrieveHabits() -> [Habit] {
        guard let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) else { return [] }
        
        return decodedHabits
    }
}

// MARK: Data Queries
extension HabitService {
    // Add Habit
    func addHabit(_ habit: Habit) {
        habits.append(habit)
        saveHabits()
    }
    
    // Delete Habit
    func deleteHabbit(_ habit: Habit) {
        habits.removeAll { $0.id == habit.id }
        saveHabits()
    }
    
    // Update Specific Habit
    func updateHabit(forHabit habit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == habit.id } ) else { return }
        
        habits[index] = habit
        saveHabits()
    }
}
