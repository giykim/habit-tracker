//
//  HabitListViewModel.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import Foundation
import Combine

class HabitListViewModel: ObservableObject {
    @Published var globalStreak: Int = 0
    @Published var habits = [Habit]()
    @Published var dateString: String = ""
    
    let UIChange = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()

    init() {
        refreshHabits()
        refreshGlobalStreak()
        dateString = updateDateString()
        
        // Event Handler
        HabitService.shared.habitServiceChanged
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.refreshHabits()
                self?.refreshGlobalStreak()
            }
            .store(in: &cancellables)
        
        if habits.count == 0 {
            HabitService.shared.resetGlobalStreak()
        }
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
        UIChange.send()
    }
    
    func refreshGlobalStreak() {
        globalStreak = HabitService.shared.globalStreak
        UIChange.send()
    }
}
