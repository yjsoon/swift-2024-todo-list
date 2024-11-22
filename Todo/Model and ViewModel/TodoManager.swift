//
//  TodoManager.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//


import Foundation
import Observation
import SwiftUI

@Observable class TodoManager {
    var todos: [Todo] = [] {
        didSet {
            save()
        }
    }
    var searchTerm = ""
    
    var todosFiltered: Binding<[Todo]> {
        Binding (
            get: {
                if self.searchTerm.isEmpty {
                    return self.todos
                }
                return self.todos.filter {
                    $0.title.localizedCaseInsensitiveContains(self.searchTerm)
                }
            },
            set: { value in
                self.todos = value
            }
        )
    }
    
    
    var numTodosLeft : Int { todos.filter { !$0.isCompleted }.count }
    var numTodosDone : Int { todos.filter { $0.isCompleted }.count }
        
    init() {
        load()
    }
    
    func addTodo(_ newTodo: Todo) {
        todos.append(newTodo)
    }
    
    func loadSampleData() {
        todos = Todo.sampleTodos
    }
    
    private func getArchiveURL() -> URL {
        URL.documentsDirectory.appending(path: "todos.json")
    }
    
    private func save() {
        let archiveURL = getArchiveURL()
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        let encodedTodos = try? jsonEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    private func load() {
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let jsonDecoder = JSONDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
           let todosDecoded = try? jsonDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
