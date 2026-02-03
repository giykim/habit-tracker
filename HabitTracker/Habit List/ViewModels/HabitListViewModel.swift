//
//  HabitListViewModel.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import Foundation

class HabitListViewModel: ObservableObject {
    @Published var habits = [Habit]()

    init() {
        habits = DeveloperPreview.habits
    }
}
