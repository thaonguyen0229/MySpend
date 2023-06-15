//
//  CalendarView.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-18.
//

import SwiftUI

struct CalendarView: View {
    let month: String
    let year: String
    private let monthName = [
        "01": "January",
        "02": "Febuary",
        "03": "March",
        "04": "April",
        "05": "May",
        "06": "June",
        "07": "July",
        "08": "August",
        "09": "September",
        "10": "October",
        "11": "November",
        "12": "December"
    ]
    private let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    private let today = Date().formatted(.iso8601)
    
    var body: some View {
        NavigationStack {
            Text((monthName[month] ?? "Unknown") + " " + year)
            HStack {
                Spacer()
                ForEach(days, id: \.self) {
                    day in Group {
                        Text(day)
                            .frame(width: 40, height: 40)
                        Spacer()
                    }
                }
                
            }
            
            let weeks = generateCalendar(month: self.month, year: self.year)
            
            ForEach(weeks.indices, id: \.self) {
                index in HStack {
                    Spacer()
                    ForEach(weeks[index], id: \.self) {
                        date in Group {
                            if Int(date) == nil {
                                Text("")
                                    .frame(width: 40, height: 40)
                            }
                            else if (today.contains([year, month, date.count == 1 ? "0" + date : date].joined(separator: "-"))) {
                                NavigationLink {
                                    CreateExpense(date: [year, month, date.count == 1 ? "0" + date : date].joined(separator: "-"))
                                } label: {
                                    Text(date)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white)
                                        .background(.red)
                                }
                            }
                            else {
                                NavigationLink {
                                    CreateExpense(date: [year, month, date.count == 1 ? "0" + date : date].joined(separator: "-"))
                                } label: {
                                    Text(date)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            Spacer()
                        }
                        
                    }
                }
            }
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(month: "06", year: "2023")
    }
}
