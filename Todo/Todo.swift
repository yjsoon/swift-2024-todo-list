//
//  Todo.swift
//  Todo
//
//  Created by YJ Soon on 3/11/24.
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var subtitle = ""
    var isCompleted = false
}
