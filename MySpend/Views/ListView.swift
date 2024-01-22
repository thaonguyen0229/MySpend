//
//  ListView.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-06-22.
//

import SwiftUI
import CoreData

struct ListView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var expenses: FetchedResults<Expense>
    var body: some View {
        List(expenses) {
            RowView(expense: $0)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
