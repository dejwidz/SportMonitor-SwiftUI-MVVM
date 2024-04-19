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
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    GoalButtonView()
                        .padding(.leading, 15)
                    ForEach(goals.goals, id: \.id) { item in
                        if item.index % 2 == 0 {
                            SingleGoalView(goal: item, text: item.name)
                                .padding(10)
                                .padding(.leading, 15)
                                .onTapGesture {
                                    print("index: \(item.index)")
                                }
                        }
                        Spacer()
                    }
                }
                Spacer()
                VStack {
                    ForEach(goals.goals, id: \.id) { item in
                        if item.index % 2 != 0 || item.index == 0 {
                            SingleGoalView(goal: item, text: item.name)
                                .padding(10)
                                .padding(.trailing, 15)
                                .onTapGesture {
                                    print("index: \(item.index)")
                                }
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            .background(Color.blue.edgesIgnoringSafeArea(.all))
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
