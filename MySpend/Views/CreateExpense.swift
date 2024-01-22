//
//  CreateExpense.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-24.
//

import SwiftUI

struct CreateExpense: View {    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var amount = ""
    @State private var description = ""
    private let categories = ["Housing", "Food", "Transportation"]
    @State private var category = "Housing"
    
    var date: String
    @State private var dateVal = Date()
    let dateFormatter = DateFormatter()
    
    @State private var showPopover = false
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section("Details") {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                    DatePicker(
                            "Date",
                            selection: $dateVal,
                            displayedComponents: [.date]
                        )
                }
                
                Section("Description") {
                    TextEditor(text: $description)
                        .frame(height: 200)
                }
                
                Button("Submit", action: {
//                    let newExpense = Expense(dateTime: dateVal, amount: Double(amount) ?? 0.0, category: category, description: description)
//                    
//                    modelData.expenses.append(newExpense)
//                    print(modelData.expenses)
                    let newExpense = Expense(context: managedObjectContext)
                    newExpense.id = UUID()
                    newExpense.amount = Double(amount) ?? 0.0
                    newExpense.category = category
                    newExpense.dateTime = dateVal
                    newExpense.note = description
    
                    PersistenceController.shared.save()
                    self.showPopover = true
                })
                
                
                    
                    
            }
            .navigationTitle(Text("New Expense"))
            .onAppear(perform: {
                print(date)
                dateFormatter.dateFormat = "yyyy-MM-dd"
                dateVal = dateFormatter.date(from: date) ?? Date()
                print(dateVal)
            })

        }
        .alert("Expense entered successfully!", isPresented:$showPopover, actions: {
            Button("Dismiss") {
                self.amount = ""
                self.description = ""
                self.showPopover = false
            }
        })
        
    }
}

struct CreateExpense_Previews: PreviewProvider {
    static var previews: some View {
        CreateExpense(date: "2023-05-12").environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
