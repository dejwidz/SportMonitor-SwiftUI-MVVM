//
//  ContentView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 10/09/2023.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    
    @EnvironmentObject var currentTraining: CurrentTraining
    @EnvironmentObject var goals: Goals
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NewTrainingScreen()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Setup")
                }
                .tag(0)
            CurrentTrainingView(vm: CurrentTrainingViewModel())
                .tabItem {
                    Image(systemName: "figure.outdoor.cycle")
                    Text("Training")
                }
                .tag(1)
            GoalsView()
                .tabItem {
                    Image(systemName: "volleyball.fill")
                    Text("Goals")
                }
                .tag(2)
        }
        .padding()
        .accentColor(Color.red)
        .onAppear {
            goals.goals = DataStorage.shared.getAllGoals().goals
            goals.setupIndexes()
        }
        .background(selectedTab == 2 ? Color.blue : Color.white)
        .edgesIgnoringSafeArea(selectedTab == 2 ? .all : [])
    }
}

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CurrentTraining())
    }
}
