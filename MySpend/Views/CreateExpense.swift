//
//  CreateExpense.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-24.
//

import SwiftUI

struct CreateExpense: View {
    @EnvironmentObject var modelData: ModelData
    @State private var amount = ""
    @State private var description = ""
    private let categories = ["Housing", "Food", "Transportation"]
    @State private var category = "Housing"
    var date: String
    
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
                    
                }
                
                Section("Description") {
                    TextEditor(text: $description)
                        .frame(height: 200)
                }
                
                Button("Submit", action: {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let newExpense = Expense(dateTime: dateFormatter.date(from: date) ?? Date(), amount: Double(amount) ?? 0.0, category: category, description: description)
                    
                    modelData.expenses.append(newExpense)
                    print(modelData.expenses)
                })
                
                
                    
                    
            }
            .navigationTitle(Text("New Expense"))
            .onAppear(perform: {print(date)})
        }
        
    }
}

struct CreateExpense_Previews: PreviewProvider {
    static var previews: some View {
        CreateExpense(date: "2023-05-12").environmentObject(ModelData())
    }
}
