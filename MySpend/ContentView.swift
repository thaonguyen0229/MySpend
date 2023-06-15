//
//  ContentView.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-31.
//

import SwiftUI

struct ContentView: View {
    @State var monthInt = 6
    @State var monthStr = "06"
    @State var yearInt = 2023
    var body: some View {
        VStack {
            CalendarView(month: monthStr, year: "2023")
            Text(monthStr)
            Button("Plus") {
                monthInt = monthInt + 1
                monthStr = "0" + monthInt.description
            }
            Button("Minus") {
                monthInt = monthInt - 1
                monthStr = "0" + monthInt.description
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
