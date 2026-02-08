//
//  HabitListViewModel.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import Foundation

class HabitListViewModel: ObservableObject {
    @Published var habits = [Habit]()
    @Published var dateString: String = ""

    init() {
        refreshHabits()
        dateString = updateDateString()
    }
    
    func updateDateString() -> String {
        let currentDate = Date()
        
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        
        return formatter.string(from: currentDate)
    }
    
    func onAddHabitDismissed() {
        refreshHabits()
    }
    
    func refreshHabits() {
        habits = HabitService.shared.retrieveHabits()
    }
}
