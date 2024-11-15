//
//  SearchableView.swift
//  Todo
//
//  Created by YJ Soon on 15/11/24.
//

import SwiftUI

struct SearchableView: View {
    
    @Environment(TodoManager.self) var todoManager
    @State private var searchTerm = ""

    var body: some View {
        NavigationStack {
            List(searchTerm.isEmpty ? todoManager.todos : todoManager.todos.filter { $0.title.localizedCaseInsensitiveContains(searchTerm) }) {
                Text($0.title)
            }
            .navigationTitle("Uneditable Todos")
            .searchable(text: $searchTerm)
        }
    }
}

#Preview {
    SearchableView()
        .environment(TodoManager())
}
