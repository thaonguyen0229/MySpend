//
//  ListView.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-06-22.
//

import SwiftUI

struct ListView: View {
    let expenses: [Expense]
    var body: some View {
        List(expenses) {
            RowView(expense: $0)
        }
    }
}

struct ListView_Previews: PreviewProvider {

    static var previews: some View {
        ListView(expenses: [
            Expense(dateTime: Date(), amount: 12.0, category: "Housing", description: "aaa"),
            Expense(dateTime: Date(), amount: 20.0, category: "Food", description: "bbb"),
            Expense(dateTime: Date(), amount: 24.0, category: "Food", description: "ccc")])
    }
}
