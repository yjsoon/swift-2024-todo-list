//
//  TodoRowView.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//


import SwiftUI

struct TodoRowView: View {
    @Bindable var todo: Todo
    
    var body: some View {
        NavigationLink {
            TodoDetailView(todo: todo)
        } label: {
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
}

#Preview {
    @Previewable @State var todo = Todo(title: "Feed demo cat")
    List {
        TodoRowView(todo: todo)
    }
}
