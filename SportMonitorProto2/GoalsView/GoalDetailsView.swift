//
//  GoalDetailsView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 11/02/2024.
//

import SwiftUI

struct GoalDetailsView<ViewModel>: View where ViewModel: GoalDetailsViewModelProtocol {
    
    @ObservedObject private(set)var vm: ViewModel
    @EnvironmentObject var goals: Goals
    @State var goal: Goal
    
    var body: some View {
        VStack {
            Text("Goal Details")
                .font(.largeTitle)
                .padding()
                .fontWeight(.heavy)
            
            Text("Name: \(goal.name)")
                .font(.headline)
                .fontWeight(.bold)
            
            Text("Type: \(goal.type.id)")
                .fontWeight(.bold)
            
            switch goal.type {
            case .distance:
                Text("Goal: \(goal.distance) km")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Current: \(goal.currentDistance) km")
            case .kcal:
                Text("Goal: \(goal.kcal) kcal")
                    .background(goal.achieved ? .green : .yellow)
                Text("Current: \(goal.currentKcal) kcal")
            case .time:
                Text("Goal: \(goal.time) hours")
                    .background(goal.achieved ? .green : .yellow)
                Text("Current: \(goal.currentTime) hours")
            }
            
            Spacer()
            Button {
                vm.deleteGoal(goal: goal)
                goals.goals = DataStorage.shared.getAllGoals().goals
                goals.setupIndexes()
                
            } label: {
                Text("Delete")
            }
            Spacer()
        }
        .background(goal.achieved ? .green : .yellow)
        .ignoresSafeArea()
    }
}

#Preview {
    GoalDetailsView(vm: GoalDetailsViewModel(goalManager: DataStorage.shared), goal: Goal())
}
