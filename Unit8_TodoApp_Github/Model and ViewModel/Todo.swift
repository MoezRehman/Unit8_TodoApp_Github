//
//  Todo.swift
//  Unit8_TodoApp_Github
//
//  Created by Moez Rehman on 3/5/23.
//

import Foundation

struct Todo: Identifiable, Codable {
    var id = UUID()
    var title: String
    var subTitle = ""
    var isCompleted = false
}
