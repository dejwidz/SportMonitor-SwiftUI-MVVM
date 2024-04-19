//
//  Goals.swift
//  SportMonitor-SwiftUI-MVVM
//
//  Created by Dawid Zimoch on 23/03/2024.
//

import Foundation

final class Goals: ObservableObject {
    
    @Published var goals: [Goal] = []
        
    init() {
        guard !goals.isEmpty else {return}
        setupIndexes()
    }
    
    func setupIndexes() {
        guard !goals.isEmpty else {return}
        
        var counter = 0
        goals.forEach { item in
            item.index = counter
            counter += 1
        }
    }
}
