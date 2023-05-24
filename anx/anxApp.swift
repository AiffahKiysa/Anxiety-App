//
//  anxApp.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 08/05/23.
//

import SwiftUI

@main
struct anxApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
