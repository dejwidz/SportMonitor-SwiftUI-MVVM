////
////  DataStorage.swift
////  SportMonitorProto2
////
////  Created by Dawid Zimoch on 07/01/2024.
////
//
import Foundation
import RealmSwift
import SwiftUI
import Combine

protocol GoalManager {
    func getAllGoals() -> Goals
    func addGoal(newGoal: Goal)
    func deleteGoal(goalToDelete: Goal)
    func actualizeGoals(kcal: Double, distance: Int, time: Int)
}

final class DataStorage: GoalManager {
    
    @EnvironmentObject var goals: Goals
    static let shared = DataStorage()
    private var storedInformation: Realm?
    
    private init() {
        do {
            storedInformation = try Realm()
        } catch {
            print("An error occurred while initializing Realm: \(error.localizedDescription)")
        }
    }
    
    func getAllGoals() -> Goals {
        
        let goals = storedInformation?.objects(GoalToStore.self)
        let goalsToReturn = Goals()
        goals?.forEach { goal in
            let newGoal = makeJustGoal(goalToChange: goal)
            goalsToReturn.goals.append(newGoal)
        }
        
        return goalsToReturn
    }
    
    func addGoal(newGoal: Goal) {
        let goal = makeGoalToStore(goalToChange: newGoal)
        guard checkIfGoalsNameHasntBeenUsed(goalToCheck: goal) else { return }
        do {
            try storedInformation?.write {
                storedInformation?.add(goal)
            }
        }
        catch {}
    }
    
    func deleteGoal(goalToDelete: Goal) {
        guard let goal = storedInformation?.objects(GoalToStore.self).filter("id == %@", goalToDelete.id).first else {
            return }
        do {
            try storedInformation?.write {
                storedInformation?.delete(goal)
            }
        } catch {
            print(error.localizedDescription)            }
    }
    
    func actualizeGoals(kcal: Double, distance: Int, time: Int) {
        let goals = storedInformation?.objects(GoalToStore.self)
        
        do {
            try storedInformation?.write {
                goals?.forEach { goal in
                    switch goal.type {
                    case "kcal":
                        goal.currentKcal += kcal
                    case "distance":
                        goal.currentDistance += distance
                    case "time":
                        goal.currentTime += time
                    default:
                        print("nothing")
                    }
                    checkIfGoalHasBeenAchieved(goal: goal)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func makeJustGoal(goalToChange: GoalToStore) -> Goal {
        let goal = Goal()
        goal.name = goalToChange.name
        
        switch goalToChange.type {
        case "kcal":
            goal.type = .kcal
        case "distance":
            goal.type = .distance
        case "time":
            goal.type = .time
        default:
            print("nothing")
        }
        
        switch goal.type {
        case .kcal:
            goal.kcal = goalToChange.kcal
            goal.currentKcal = goalToChange.currentKcal
        case .distance:
            goal.distance = goalToChange.distance
            goal.currentDistance = goalToChange.currentDistance
        case .time:
            goal.time = goalToChange.time
            goal.currentTime = goalToChange.currentTime
        }
        goal.id = goalToChange.id
        goal.achieved = goalToChange.achieved
        return goal
    }
    
    private func makeGoalToStore(goalToChange: Goal) -> GoalToStore {
        let goal = GoalToStore()
        goal.name = goalToChange.name
        switch goalToChange.type {
        case .kcal:
            goal.type = "kcal"
        case .distance:
            goal.type = "distance"
        case .time:
            goal.type = "time"
        }
        
        switch goal.type {
        case "kcal":
            goal.kcal = goalToChange.kcal
        case "distance":
            goal.distance = goalToChange.distance
        case "time":
            goal.time = goalToChange.time
        default:
            print("nothing")
        }
        goal.id = goalToChange.id
        goal.achieved = goalToChange.achieved
        return goal
    }
    
    private func checkIfGoalHasBeenAchieved(goal: GoalToStore) {
        switch goal.type {
        case "kcal":
            goal.achieved = goal.currentKcal > Double(goal.kcal)
        case "distance":
            goal.achieved = goal.currentDistance > goal.distance
        case "time":
            goal.achieved = goal.currentTime > ((goal.time) * 3600)
        default:
            print("nothing")
        }
    }
    
    private func checkIfGoalsNameHasntBeenUsed(goalToCheck: GoalToStore) -> Bool {
        var valueToReturn = true
        let goals = storedInformation?.objects(GoalToStore.self)
        goals?.forEach { goal in
            valueToReturn = goal.id != goalToCheck.id && goal.name != goalToCheck.name
        }
        return valueToReturn
    }
}
