//
//  HowManyMoreview.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @Environment(TodoManager.self) var todoManager

    var body: some View {
        VStack {
            Text("You have:")
                .font(.largeTitle)
            Text("\(todoManager.numTodosLeft)")
                .font(.system(size: 140))
                .foregroundStyle(.blue)
                .padding()
            Text(todoManager.numTodosLeft == 1 ? "todo left.": "todos left.")
                .font(.largeTitle)
            Text("You have completed ^[\(todoManager.numTodosDone) todos](inflect: true). Good job.")
                .padding(.top)
        }

    }
}

#Preview {
    HowManyMoreView()
        .environment(TodoManager())
}
