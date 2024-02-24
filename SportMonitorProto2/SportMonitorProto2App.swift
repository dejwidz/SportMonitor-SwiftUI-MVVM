//
//  SportMonitorProto2App.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 10/09/2023.
//

import SwiftUI


@available(iOS 17.0, *)
@main
struct SportMonitorProto2App: App {
    
    @StateObject var currentTraining = CurrentTraining()
    @StateObject var goals = Goals()
    
    var body: some Scene {
        WindowGroup {
            InitialView(vm: InitialViewViewModel())
                .environmentObject(currentTraining)
                .environmentObject(goals)
        }
    }
}
