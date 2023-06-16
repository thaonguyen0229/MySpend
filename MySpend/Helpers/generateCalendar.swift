//
//  generateCalendar.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-22.
//

import Foundation

func generateCalendar(month: String, year: String) -> [[String]] {
    let letters = ["a","b","c","d","e","f"]
    var result: [[String]] = [[]]
    let calendar = Calendar(identifier: .gregorian)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM"
    let date = dateFormatter.date(from: year + "-" + month) ?? Date()
    let numOfDays = calendar.range(of: .day, in: .month, for: date)!.count
   
    var firstWeekday = calendar.component(.weekday, from: date) -  (calendar.component(.day, from: date) % 7)
    
    if (firstWeekday < 0) {
        firstWeekday = firstWeekday + 7
    }
    
    for i in 0..<firstWeekday {
        result[0].append(letters[i])
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

