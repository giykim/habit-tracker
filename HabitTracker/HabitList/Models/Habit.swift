//
//  Habit.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/3/26.
//

import Foundation

struct Habit: Identifiable, Encodable, Decodable {
    let id: String
    var emoji: String
    var title: String
    var description: String
    var streak: Int
    var lastDateDone: Date?
}
