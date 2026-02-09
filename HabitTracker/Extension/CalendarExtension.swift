//
//  CalendarExtension.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/8/26.
//

import Foundation

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays =  dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day! + 1
    }
}
