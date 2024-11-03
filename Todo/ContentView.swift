//
//  ContentView.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(title: "Feed the cat", isCompleted: true),
                                Todo(title: "Play with cat"),
                                Todo(title: "Get allergies"),
                                Todo(title: "Run away from cat"),
                                Todo(title: "Get a new cat")]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($todos) { $todo in
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        Text(todo.title)
                            .strikethrough(todo.isCompleted)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
