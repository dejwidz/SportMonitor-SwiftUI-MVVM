//
//  NewTrainingScreen.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 10/09/2023.
//

import SwiftUI

struct NewTrainingScreen: View {
    
    @EnvironmentObject var currentTraining: CurrentTraining
    @State private var selectedSport: Sports = .Alpinism
    @State private var weight: Double = 40
    
    private let sportSelections: [SportSelection] = SportSelection.sportSelections
    var body: some View {
        Form {
            Section(header: Text("Just choose what sport you will practice now, SportMonitor will count burned callories and distance").textCase(.none).lineLimit(3, reservesSpace: true).fontWeight(.bold)) {
                Picker("Select a Sport", selection: $currentTraining.discipline) {
                    ForEach(sportSelections) { selection in
                        Text(selection.sport.id).tag(selection.sport)
                    }
                }
            }
            .pickerStyle(.wheel)
            Section(header: Text("You have to enter your weight in kilograms to to properly calculate your burned callories").textCase(.none).fontWeight(.bold)) {
                Picker("Select a Value", selection: $currentTraining.weight) {
                    ForEach(40...200, id: \.self) { value in
                        Text("\(value)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
        }
    }
}

struct NewTrainingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewTrainingScreen()
            .environmentObject(CurrentTraining())
    }
}
