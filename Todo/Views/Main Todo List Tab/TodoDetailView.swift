//
//  TodoDetailView.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Bindable var todo: Todo
    
    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            TextField("Subtitle", text: $todo.subtitle)
                .foregroundStyle(.gray)
            Toggle("Completed?", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo Detail")
    }
}

#Preview {
    @Previewable @State var todo = Todo(title: "Feed demo cat")
    TodoDetailView(todo: todo)
}
