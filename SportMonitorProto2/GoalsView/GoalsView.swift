//
//  GoalsView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 12/11/2023.
//

import SwiftUI

struct GoalsView: View {
    
    @EnvironmentObject var goals: Goals
    @State private var clicked = false
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [
                GridItem(),
                GridItem()
            ]) {
                GoalButtonView(text: "add new goal")
                    .padding(.top, goals.goals.isEmpty ? 50 : -50)
                
                ForEach(goals.goals, id: \.id) { item in
                    if item.index == 0  {
                        SingleGoalView(goal: item, text: item.name)
                            .padding(.top, 100)
                            .onTapGesture {
                                print("index: \(item.index)")
                            }
                    }
                    
                    if item.index % 2 == 0 && item.index != 0 {
                        SingleGoalView(goal: item, text: item.name)
                            .padding(.top, -10)
                            .onTapGesture {
                                print("index: \(item.index)")
                            }
                    }
                    else if item.index != 0 {
                        SingleGoalView(goal: item, text: item.name)
                            .padding(.top, -130)
                            .onTapGesture {
                                print("index: \(item.index)")
                            }
                    }
                }
            }
            .padding()
            .background(Color.blue)
        }
        .onAppear() {
            goals.setupIndexes()
        }
        .background(Color.blue)
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
            .environmentObject(Goals())
    }
}
