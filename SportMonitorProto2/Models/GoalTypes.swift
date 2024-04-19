//
//  GoalTypes.swift
//  SportMonitor-SwiftUI-MVVM
//
//  Created by Dawid Zimoch on 23/03/2024.
//

import Foundation

enum GoalTypes: String, Identifiable {
    case kcal
    case distance
    case time
    
    var id: String {
        self.rawValue.lowercased()
    }
}
