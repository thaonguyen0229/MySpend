//
//  ContentView.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let calendar = Calendar(identifier: .gregorian)
        let month = String(format: "%02d",calendar.component(.month, from: Date()))
        let year = (calendar.component(.year, from: Date())).description
        TabView {
            CalendarView(month: month, year: year)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            CreateExpense(date: "2023-05-12")
                .tabItem {
                    Label("Track", systemImage: "plus.app.fill")
                }
            Text("List")
                .tabItem {
                    Label("List", systemImage: "list.star")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
