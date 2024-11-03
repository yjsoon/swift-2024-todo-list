//
//  ContentView.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddSheet = false
    
    @State private var todos = [Todo(title: "Feed the cat", isCompleted: true),
                                Todo(title: "Play with cat", subtitle: "Use his favourite String!"),
                                Todo(title: "Get allergies"),
                                Todo(title: "Run away from cat"),
                                Todo(title: "Get a new cat")]
    
    var body: some View {
        NavigationStack {
            List ($todos, editActions: [.all]) { $todo in
                NavigationLink {
                    TodoDetailView(todo: $todo)
                } label:{
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        VStack(alignment: .leading) {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                            if !todo.subtitle.isEmpty {
                                Text(todo.subtitle)
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                                    .strikethrough(todo.isCompleted)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NewTodoView(sourceArray: $todos)
                    .presentationDetents([.medium])
            }

        }
    }
}

#Preview {
    ContentView()
}
