//
//  GoalsViewModel.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 27/01/2024.
//

import Foundation
import SwiftUI

protocol GoalDetailsViewModelProtocol: ObservableObject {
    var goal: Goal {get set}
    func deleteGoal()
}

class GoalDetailsViewModel: GoalDetailsViewModelProtocol {
    
    @Published var goal: Goal
    var goals: Goals
    let goalManager: GoalManager
    
    init(goalManager: GoalManager, goal: Goal, goals: Goals) {
        self.goalManager = goalManager
        self.goal = goal
        self.goals = goals
    }
    
    func deleteGoal() {
        goalManager.deleteGoal(goalToDelete: goal)
        goals.goals = goalManager.getAllGoals().goals
        goals.setupIndexes()
    }
}
