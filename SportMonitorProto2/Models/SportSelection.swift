//
//  SportSelection.swift
//  SportMonitor-SwiftUI-MVVM
//
//  Created by Dawid Zimoch on 23/03/2024.
//

import Foundation

struct SportSelection: Identifiable {
    let id = UUID()
    let sport: Sports
    static let sportSelections: [SportSelection] = Sports.allCases.map { SportSelection(sport: $0) }
}
