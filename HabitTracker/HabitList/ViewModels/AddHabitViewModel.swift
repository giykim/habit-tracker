//
//  AddHabitViewModel.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/6/26.
//

import Foundation

class AddHabitViewModel: ObservableObject {
    @Published var emoji: String = ""
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var error: String = ""
    
    func addNewHabit() -> Bool {
        if (validateNewHabit()) {
            error = ""
            
            DeveloperPreview.habits.append(Habit(
                id: UUID().uuidString,
                emoji: emoji,
                title: title,
                description: description,
                streak: 0
            ))
            
            eraseTextField()
            
            return true
        }
        
        error = "Please make sure all fields are filled."
        
        return false
    }
    
    func validateNewHabit() -> Bool {
        return emoji.count > 0
            && title.count > 1
            && description.count > 1
    }
    
    func eraseTextField() {
        emoji = ""
        title = ""
        description = ""
    }
}
