//
//  ContentView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 11/02/2024.
//

import SwiftUI

struct SingleGoalView: View {
    
    @EnvironmentObject var goals: Goals
    @State var goal: Goal
    @State var clicked = false
    let text: String
    private let size = CGFloat(UIScreen.main.bounds.width * 0.4)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: size, height: size)
            .foregroundColor(goal.achieved ? .green : .red)
            .overlay(
                VStack {
                    Spacer()
                    Text(goal.name)
                    Spacer()
                    switch goal.type {
                    case .distance:
                        Text("Goal: \(goal.distance) km")
                        Text("Current: \(goal.formattedStringDISTANCE) m")
                    case .kcal:
                        Text("Goal: \(goal.kcal) kcal")
                        
                        Text("Current: \(goal.formattedStringKCAL) kcal")
                    case .time:
                        Text("Goal: \(goal.time) hours")
                        Text(goal.timeString)
                    }
                    Spacer()
                }
                    .foregroundColor(.white)
                    .bold()
            )
            .padding(5)
            .background(Color.blue)
            .cornerRadius(10)
            .onLongPressGesture {
                clicked = !clicked
            }
            .sheet(isPresented: $clicked, onDismiss: {
            }, content: {
                GoalDetailsView(vm: GoalDetailsViewModel(goalManager: DataStorage.shared, goal: goal, goals: goals))
            })
            .onDisappear {
                goals.setupIndexes()
            }
    }
}

//#Preview {
//    if #available(iOS 17.0, *) {
//        SingleGoalView(goal: Goal(), text: "new goal")
//    } else {
//        // Fallback on earlier versions
//    }
//}
