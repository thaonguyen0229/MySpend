//
//  PersistenceController.swift
//  MySpend
//
//  Created by Amanda Pham on 2024-01-11.
//

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        let expense = Expense(context: controller.container.viewContext)
        expense.amount = 20.0
        expense.category = "Housing"
        expense.dateTime = Date()

        // Create 10 example programming languages.
//        for _ in 0..<10 {
//            let language = ProgrammingLanguage(context: controller.container.viewContext)
//            language.name = "Example Language 1"
//            language.creator = "A. Programmer"
//        }

        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "Model")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
//        for description in container.persistentStoreDescriptions {
//            print(description.type)
//            print(description.url ?? "no url")
//        }
//        print(container.persistentStoreDescriptions.first?.url ?? "no url")
        let context = container.viewContext
//        print("object has change")
//        print(context.hasChanges)
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("save error:\(error)")
            }
        }
    }
}
