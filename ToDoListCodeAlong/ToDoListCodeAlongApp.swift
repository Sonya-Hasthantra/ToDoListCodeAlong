//
//  ToDoListCodeAlongApp.swift
//  ToDoListCodeAlong
//
//  Created by Dilan Hasthantra on 6/13/23.
//

import SwiftUI

@main
struct ToDoListCodeAlongApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
