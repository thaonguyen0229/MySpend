//
//  generateCalendar.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-22.
//

import Foundation

func generateCalendar() -> [[String]] {
    var result: [[String]] = [[]]
    let today = Date()
    let calendar = Calendar.current
    let numOfDays = calendar.range(of: .day, in: .month, for: today)!.count
   
    var firstWeekday = calendar.component(.weekday, from: today) -  (calendar.component(.day, from: today) % 7)
    
    if (firstWeekday < 0) {
        firstWeekday = firstWeekday + 7
    }
    print(firstWeekday)
    
    for _ in 1...firstWeekday {
        result[0].append("")
    }
    
    for day in 1...numOfDays {
        if (result.last!.count < 7) {
            result[result.count - 1].append(day.description)
        } else {
            result.append([day.description])
        }
    }
    
    while (result.last!.count < 7) {
        result[result.count - 1].append("")
    }
    
    return result
}
