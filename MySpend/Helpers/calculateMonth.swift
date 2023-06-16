//
//  calculateMonth.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-06-15.
//

import Foundation

func calculateMonth(_ month: String, _ year: String, _ operation: Int) -> (String, String) {
    guard Int(month) != nil && Int(year) != nil else {
        return (month, year)
    }
    var monthInt = Int(month)! + operation
    var yearInt = Int(year)!
    
    if monthInt < 1 {
        yearInt = yearInt - (abs(monthInt)/12 + 1)
        monthInt = 12 - (abs(monthInt) % 12)
    }
    else if monthInt > 12 {
        yearInt = yearInt + monthInt/12
        monthInt = monthInt % 12
    }
    
    return (String(format: "%02d", monthInt), yearInt.description)
}
