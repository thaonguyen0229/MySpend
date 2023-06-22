//
//  RowView.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-06-22.
//

import SwiftUI

struct RowView: View {
    let expense: Expense
    var body: some View {
        HStack {
            Text(expense.category)
                .padding(10)
            Spacer()
            Text(expense.amount.description)
                .padding(10)
        }
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(expense: Expense(dateTime: Date(), amount: 12.0, category: "Housing", description: "aaa"))
    }
}
