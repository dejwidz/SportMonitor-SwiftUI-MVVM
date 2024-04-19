//
//  GoalToStore.swift
//  SportMonitor-SwiftUI-MVVM
//
//  Created by Dawid Zimoch on 23/03/2024.
//

import Foundation
import RealmSwift

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
