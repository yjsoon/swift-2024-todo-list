//
//  TodoManager.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//


import Foundation
import Observation

@Observable class TodoManager {
    var todos: [Todo] = [] {
        didSet {
            save()
        }
    }
    
    var numTodosLeft : Int { todos.filter { !$0.isCompleted }.count }
    var numTodosDone : Int { todos.filter { $0.isCompleted }.count }
        
    init() {
        load()
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
