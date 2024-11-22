import SwiftUI

struct NewTodoView: View {
    
    @State private var todoTitle = ""
    @State private var todoSubtitle = ""
    @Environment(\.dismiss) var dismiss
    @Environment(TodoManager.self) var todoManager
    
    var body: some View {
        Form {
            Section("Info") {
                TextField("Title", text: $todoTitle)
                TextField("Subtitle", text: $todoSubtitle)
            }
            
            Section("Actions") {
                Button("Save") {
                    let todo = Todo(title: todoTitle, subtitle: todoSubtitle)
                    todoManager.addTodo(todo)
                    dismiss()
                }
                .disabled(todoTitle.isEmpty) // prevent saving if no title

                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NewTodoView()
        .environment(TodoManager())
}
