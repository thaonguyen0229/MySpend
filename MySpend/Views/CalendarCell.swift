//
//  CalendarCell.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-18.
//

import SwiftUI

struct CalendarCell: View {
    var date: String
    var body: some View {
        Text(date)
            .frame(width: 40, height: 40)
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(date: "30")
    }
}
