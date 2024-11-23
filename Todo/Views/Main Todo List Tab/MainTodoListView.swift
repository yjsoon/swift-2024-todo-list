//
//  MainTodoListView.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI
import SwiftData

struct MainTodoListView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Todo.sortIndex) var todos: [Todo]
    @State private var showConfirmAlert = false
    @State private var showAddSheet = false
    @State private var searchTerm = ""
    
    var filteredTodos: [Todo] {
        if searchTerm.isEmpty {
            return todos
        } else {
            return todos.filter { $0.title.localizedStandardContains(searchTerm) }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(filteredTodos) { todo in
                    TodoRowView(todo: todo)
                }
                .onDelete(perform: deleteTodos)
                .onMove(perform: moveTodos)
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
#if DEBUG
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    }
#endif
                    
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NewTodoView()
                    .presentationDetents([.medium])
            }
            .alert("Load sample data? Warning: This cannot be undone!", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive, action: loadSampleData)
            }
            
        }
        
    }
    
    private func deleteTodos(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(todos[index])
        }
    }
    
    private func moveTodos(from source: IndexSet, to destination: Int) {
        
        // We need to "manually" sort things by editing their sort indices.
        var revisedItems = todos.map { $0 }
        revisedItems.move(fromOffsets: source, toOffset: destination)
        for (index, item) in revisedItems.enumerated() {
            item.sortIndex = index
        }
    }
    
    private func loadSampleData() {
        todos.forEach { modelContext.delete($0) }
        Todo.sampleTodos.forEach { modelContext.insert($0) }
    }
    
}

#Preview {
    MainTodoListView()
        .modelContainer(for: Todo.self, inMemory: true)
}
