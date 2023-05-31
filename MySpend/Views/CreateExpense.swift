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
                    modelData.expenses.append(Expense(dateTime: Date(), amount: Double(amount) ?? 0.0, category: category, description: description))
                    print(modelData.expenses)
                })
                
                
                    
                    
            }
            .navigationTitle(Text("New Expense"))
        }
        
    }
}

struct CreateExpense_Previews: PreviewProvider {
    static var previews: some View {
        CreateExpense().environmentObject(ModelData())
    }
}
