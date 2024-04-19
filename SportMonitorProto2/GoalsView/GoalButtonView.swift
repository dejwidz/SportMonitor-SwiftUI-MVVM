//
//  GoalButtonView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 11/02/2024.
//

import SwiftUI

struct GoalButtonView: View {
    
    @State private var isSecondScreenPresented = false
    private let size = CGFloat(UIScreen.main.bounds.width * 0.4)

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: size, height: size)
            .overlay(
                NavigationView {
                    VStack {
                        Text("Add new goal")
                            .foregroundColor(.black)
                            .frame(width: size, height: size)
                    }
                    .sheet(isPresented: $isSecondScreenPresented) {
                        NewGoalView(vm: NewGoalViewModel(newGoal: Goal(), model: DataStorage.shared))
                    }
                }
                    .bold()
                    .cornerRadius(10)
            )
            .padding(5)
            .cornerRadius(10)
            .onTapGesture {
                isSecondScreenPresented.toggle()
            }
    }
}
