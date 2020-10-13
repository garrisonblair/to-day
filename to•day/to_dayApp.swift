//
//  to_dayApp.swift
//  to-day
//
//  Created by Garrison Blair on 2020-10-05.
//

import SwiftUI

@main
struct to_dayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
