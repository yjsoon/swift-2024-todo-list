//
//  MainTodoListView.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI

struct MainTodoListView: View {
    
    @Environment(TodoManager.self) var todoManager
    @State private var showConfirmAlert = false
    @State private var showAddSheet = false
    
    var body: some View {
        @Bindable var todoManager = todoManager
        
        NavigationStack {
            List (todoManager.todosFiltered, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
            }
            .searchable(text: $todoManager.searchTerm)
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
                NewTodoView(sourceArray: $todoManager.todos)
                    .presentationDetents([.medium])
            }
            .alert("Load sample data? Warning: This cannot be undone!", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleData()
                }
            }

        }

    }
}

#Preview {
    MainTodoListView()
        .environment(TodoManager())
}
