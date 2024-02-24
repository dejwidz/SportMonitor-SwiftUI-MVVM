//
//  GoalsViewModel.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 27/01/2024.
//

import Foundation
import SwiftUI

protocol GoalDetailsViewModelProtocol: ObservableObject {
    func deleteGoal(goal: Goal)
}

class GoalDetailsViewModel: GoalDetailsViewModelProtocol {
    
    let goalManager: GoalManager
    
    init(goalManager: GoalManager) {
        self.goalManager = goalManager
    }
    
    func deleteGoal(goal: Goal) {
        goalManager.deleteGoal(goalToDelete: goal)
    }
}
