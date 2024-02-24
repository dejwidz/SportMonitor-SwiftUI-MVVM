//
//  Goals.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 10/09/2023.
//

import Foundation
import Combine
import RealmSwift

final class Goal: ObservableObject, Identifiable, Hashable {
    
    @Published var name: String = "My new goal"
    @Published var type: GoalTypes = .distance
    @Published var kcal: Int = 0
    @Published var distance: Int = 0
    @Published var time: Int = 0
    @Published var currentKcal: Double = 0
    @Published var currentDistance: Int = 0
    @Published var currentTime: Int = 0
    @Published var index: Int = 0
    @Published var id = UUID()
    @Published var achieved = false
    
    var formattedStringKCAL: String {
        return String(format: "%.2f", currentKcal)
    }
    
    var formattedStringDISTANCE: String {
        return String(format: "%.2f", "Current: \(currentDistance) m")
    }
    
    var timeString: String {
        return "Current: \(currentTime/3600)hrs \((currentTime%3600)/60) m \((currentTime%3600)%60) s"
    }
    
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}

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

final class GoalToStore: Object {
    @Persisted var name: String = ""
    @Persisted var type: String = ""
    @Persisted var kcal: Int = 0
    @Persisted var distance: Int = 0
    @Persisted var time: Int = 0
    @Persisted var currentKcal: Double = 0
    @Persisted var currentDistance: Int = 0
    @Persisted var currentTime: Int = 0
    @Persisted var id = UUID()
    @Persisted var achieved = false
}

