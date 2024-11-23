//
//  Todo.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftData

@Model class Todo: Equatable {
    var title: String
    var subtitle: String
    var isCompleted: Bool
    var sortIndex: Int
    
    init(title: String, subtitle: String = "", isCompleted: Bool = false, sortIndex: Int = 0) {
        self.title = title
        self.subtitle = subtitle
        self.isCompleted = isCompleted
        self.sortIndex = sortIndex
    }
}
