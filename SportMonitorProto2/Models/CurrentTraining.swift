//
//  CurrentTraining.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 10/09/2023.
//

import Foundation
import CoreLocation

class CurrentTraining: ObservableObject {
    
    @Published var discipline: Sports = .alpinism
    @Published var weight: Int = 45
    @Published var totalDistance: CLLocationDistance = 0.0
}
