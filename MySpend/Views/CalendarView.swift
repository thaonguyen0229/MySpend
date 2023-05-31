//
//  CalendarView.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-18.
//

import SwiftUI

struct CalendarView: View {
    private let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    private let weeks = generateCalendar()
    var body: some View {
        VStack {
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
            ForEach(weeks, id: \.self) {
                week in HStack {
                    Spacer()
                    ForEach(week, id: \.self) {
                        date in Group {
                            CalendarCell(date: date)
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
        CalendarView()
    }
}
