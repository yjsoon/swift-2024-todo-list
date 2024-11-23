import SwiftUI
import SwiftData

struct NewTodoView: View {
    
    @State private var todoTitle = ""
    @State private var todoSubtitle = ""
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var todos: [Todo]

    var body: some View {
        Form {
            Section("Info") {
                TextField("Title", text: $todoTitle)
                TextField("Subtitle", text: $todoSubtitle)
            }
            
            Section("Actions") {
                Button("Save") {
                    let todo = Todo(title: todoTitle, subtitle: todoSubtitle, isCompleted: false, sortIndex: todos.count)
                    modelContext.insert(todo)
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
        .modelContainer(for: Todo.self, inMemory: true)
}
