//
//  ContentView.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(title: "Feed the cat"),
                                Todo(title: "Play with cat"),
                                Todo(title: "Get allergies"),
                                Todo(title: "Run away from cat"),
                                Todo(title: "Get a new cat")]
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                Text(todo.title)
            }
        }
    }
}

#Preview {
    ContentView()
}
