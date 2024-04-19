//
//  MapView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 05/10/2023.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @EnvironmentObject var currentTraining: CurrentTraining
    @Published var location: CLLocation?
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        self.location = newLocation
    }
}
