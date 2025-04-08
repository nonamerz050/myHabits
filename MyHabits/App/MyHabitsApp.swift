//
//  MyHabitsApp.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import SwiftUI
import SwiftData

@main
struct MyHabitsApp: App {
    
    @StateObject private var container = DIContainer()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
