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
    
    var body: some View {
        TabView {
            NewTrainingScreen()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Setup")
                }
            
            CurrentTrainingView(vm: CurrentTrainingViewModel())
                .tabItem {
                    Image(systemName: "figure.outdoor.cycle")
                    Text("Training")
                }
            GoalsView()
                .tabItem {
                    Image(systemName: "volleyball.fill")
                    Text("Goals")
                }
        }
        .padding()
        .accentColor(Color.red)
        .onAppear {
            goals.goals = DataStorage.shared.getAllGoals().goals
            goals.setupIndexes()
        }
    }
    
}

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CurrentTraining())
    }
}
