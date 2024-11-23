//
//  TodoApp.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI
import SwiftData

@main
struct TodoApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
