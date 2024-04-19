//
//  GoalDetailsView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 11/02/2024.
//

import SwiftUI

struct GoalDetailsView<ViewModel>: View where ViewModel: GoalDetailsViewModelProtocol {
    
    @EnvironmentObject var goals: Goals
    @ObservedObject private(set)var vm: ViewModel
    
    var body: some View {
        VStack {
            Text("Goal Details")
                .font(.largeTitle)
                .padding()
                .fontWeight(.heavy)
            Text("Name: \(vm.goal.name)")
                .font(.headline)
                .fontWeight(.bold)
            Text("Type: \(vm.goal.type.id)")
                .fontWeight(.bold)
            switch vm.goal.type {
            case .distance:
                Text("Goal: \(vm.goal.distance) km")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Current: \(vm.goal.currentDistance) km")
            case .kcal:
                Text("Goal: \(vm.goal.kcal) kcal")
                    .background(vm.goal.achieved ? .green : .yellow)
                Text("Current: \(vm.goal.currentKcal) kcal")
            case .time:
                Text("Goal: \(vm.goal.time) hours")
                    .background(vm.goal.achieved ? .green : .yellow)
                Text("Current: \(vm.goal.currentTime) hours")
            }
            Spacer()
            Button {
                vm.deleteGoal()
            } label: {
                Text("Delete")
            }
            Spacer()
        }
        .background(vm.goal.achieved ? .green : .yellow)
        .ignoresSafeArea()
    }
}

#Preview {
    GoalDetailsView(vm: GoalDetailsViewModel(goalManager: DataStorage.shared, goal: Goal(), goals: Goals()))
}
