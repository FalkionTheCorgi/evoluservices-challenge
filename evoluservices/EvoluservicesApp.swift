//
//  evoluservicesApp.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import SwiftUI

@main
struct evoluservicesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListView()
        }
    }
}
