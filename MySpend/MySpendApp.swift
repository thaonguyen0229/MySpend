//
//  MySpendApp.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-31.
//

import SwiftUI

@main
struct MySpendApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
