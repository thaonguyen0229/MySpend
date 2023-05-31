//
//  Expense.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-22.
//

import Foundation

struct Expense {
    var dateTime: Date
    var amount: Double
    var description: String
    var category: String
    
    init(dateTime: Date, amount: Double, category: String, description: String) {
        self.dateTime = dateTime
        self.amount = round(amount*100)/100.0 // round to 2 decimal places
        self.description = description
        self.category = category
    }
}
