//
//  TodoApp.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI

@main
struct TodoApp: App {
    
    // Create one TodoManager for the whole app
    @State var todoManager = TodoManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(todoManager)
    }
}
