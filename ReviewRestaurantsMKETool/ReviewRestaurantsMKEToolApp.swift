//
//  ReviewRestaurantsMKEToolApp.swift
//  ReviewRestaurantsMKETool
//
//  Created by Amin Phakhruddin on 11/4/20.
//

import SwiftUI

@main
struct ReviewRestaurantsMKEToolApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
