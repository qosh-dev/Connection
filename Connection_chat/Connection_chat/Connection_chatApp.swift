//
//  Connection_chatApp.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/9/21.
//

import SwiftUI

@main
struct Connection_chatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
