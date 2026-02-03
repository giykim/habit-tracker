//
//  DeveloperPreview.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import Foundation

class DeveloperPreview {
    // MARK: Habits
    static let habits: [Habit] = [
        .init(
            id: NSUUID().uuidString,
            emoji: "🖊️",
            title: "Apply to jobs",
            description: "Apply to three jobs",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            emoji: "⌨️",
            title: "LeetCode",
            description: "Solve one LeetCode question",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            emoji: "💻",
            title: "Study",
            description: "Follow one coding tutorial video",
            streak: 0
        )
    ]
}
