//
//  NewGoalViewModel.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 24/01/2024.
//

import Foundation
import SwiftUI

protocol NewGoalViewModelProtocol: ObservableObject {
    var newGoal: Goal {get set}
    func saveNewGoal()
}

class NewGoalViewModel: NewGoalViewModelProtocol {
    
    @Published var newGoal: Goal
    var model: GoalManager
    
    init(newGoal: Goal, model: GoalManager) {
        self.newGoal = newGoal
        self.model = model
    }
    
    func saveNewGoal() {
        model.addGoal(newGoal: newGoal)
    }
}
