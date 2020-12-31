//
//  UI_92App.swift
//  UI-92
//
//  Created by にゃんにゃん丸 on 2020/12/31.
//

import SwiftUI

@main
struct UI_92App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
