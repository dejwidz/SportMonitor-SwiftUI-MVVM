//
//  NewGoalView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 26/11/2023.
//

import SwiftUI

struct NewGoalView<ViewModel>: View where ViewModel: NewGoalViewModelProtocol {
    
    @EnvironmentObject private var goals: Goals
    @ObservedObject private(set)var vm: ViewModel
    
    var body: some View {
        VStack{
            Spacer()
            Text("Your new goal")
            Spacer()
            TextField("", text: $vm.newGoal.name)
            Spacer()
            Picker("Select a Value", selection: $vm.newGoal.type) {
                ForEach([GoalTypes.distance, GoalTypes.kcal, GoalTypes.time], id: \.self) { value in
                    Text("\(value.id)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            Spacer()
            
            if vm.newGoal.type == .kcal {
                Text("Choose how many thousands of callories do you want to burn")
                Picker("Select a Value", selection: $vm.newGoal.kcal ) {
                    ForEach(40...500, id: \.self) { value in
                        Text("\(value)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
            }
            else if vm.newGoal.type == .distance {
                Text("Choose how many kilometers do you want to pass")
                Picker("Select a Value", selection: $vm.newGoal.distance ) {
                    ForEach(10...1000, id: \.self) { value in
                        Text("\(value)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
            }
            else if vm.newGoal.type == .time {
                Text("Choose how many hours do you want to spend practicing sport")
                Picker("Select a Value", selection: $vm.newGoal.time ) {
                    ForEach(1...100, id: \.self) { value in
                        Text("\(value)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            Spacer()
            Button(action: {
                saveButtonTapped()
            }) {
                Text("Add goal")
                    .font(.headline)
                    .padding()
                    .background(Color("ColorBlueYellow"))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
            Spacer()
        }
        .background(Color.yellow)
    }
    
    private func saveButtonTapped() {
        
        vm.saveNewGoal()
        goals.goals = DataStorage.shared.getAllGoals().goals
        goals.setupIndexes()
    }
}

#Preview {
    NewGoalView(vm: NewGoalViewModel(newGoal: Goal(), model: DataStorage.shared))
        .environmentObject(Goals())
}
