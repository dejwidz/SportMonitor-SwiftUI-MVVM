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
    
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return lhs.id == rhs.id
    }
    var formattedStringKCAL: String {
        return String(format: "%.2f", currentKcal)
    }
    
    var formattedStringDISTANCE: String {
        return String(format: "%.2f", "Current: \(currentDistance) m")
    }
    
    var timeString: String {
        return "Current: \(currentTime/3600)hrs \((currentTime%3600)/60) m \((currentTime%3600)%60) s"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
