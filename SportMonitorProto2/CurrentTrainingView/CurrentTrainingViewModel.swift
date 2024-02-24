//
//  CurrentTrainingViewModel.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 17/09/2023.
//

import Foundation
import SwiftUI
import Combine
import MapKit

protocol CurrentTrainingViewModelProtocol: ObservableObject {
    var formattedCurrentTime: String { get }
    var formattedKcalBurned: String { get }
    var formattedDistance: String { get }
    var positions: [CLLocationCoordinate2D] { get }
    func setup(currentTraining: CurrentTraining)
    func endTraining()
    func stopTimer()
    func startTimer()
    func addCoordinates(newCoordinates: CLLocationCoordinate2D)
}

final class CurrentTrainingViewModel: CurrentTrainingViewModelProtocol {
    @Published var formattedCurrentTime = "0.00"
    @Published var formattedKcalBurned = "0.00"
    @Published var formattedDistance = "0.00 m."
    @Published var positions: [CLLocationCoordinate2D] = []
    private var currentTrainingTime = 0.00
    private var currentKcalBurned = 0.00
    private var currentDistance = 0.00
    private var currentDiscipline: Sports = .Alpinism
    private var weight = 80.00
    private var timer: Timer?
    private var kcalPerSecond = 0.00
    private var oneSecondAgoDistance = 0.00
    private var lastSecondDistance = 0.00
    private var counter = 0 {
        didSet {
            if counter == 100 {
                updateGoals()
                calculateLastSecondDistance(currentDistance: currentDistance, secondAgoDistance: oneSecondAgoDistance)
                counter = 0
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.currentTrainingTime += 0.01
            self.formatCurrentTime()
            self.calculateBurnedKcal()
            self.counter += 1
        }
    }
    
    private func formatCurrentTime() {
        formattedCurrentTime = String(format: "%.2f", currentTrainingTime)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func formatBurnedKcal() {
        formattedKcalBurned = String(format: "%.2f", currentKcalBurned)
    }
    
    private func calculateBurnedKcal() {
        kcalPerSecond = currentDiscipline.kcalPerHour / 3600
        let kcalPerKilo = kcalPerSecond / 80
        currentKcalBurned = kcalPerKilo * weight * currentTrainingTime
        formatBurnedKcal()
    }
    
    func endTraining() {
        stopTimer()
        currentKcalBurned = 0
        currentTrainingTime = 0
        positions = []
        formattedKcalBurned = "0.00"
        formattedCurrentTime = "0.00"
        formattedDistance = "0.00 m."
    }
    
    func setup(currentTraining: CurrentTraining) {
        currentDiscipline = currentTraining.discipline
        weight = Double(currentTraining.weight)
    }
    
    func addCoordinates(newCoordinates: CLLocationCoordinate2D) {
        positions.append(newCoordinates)
        formatCurrentDistance()
    }
    
    func calculatePolyLineLength(points: [CLLocationCoordinate2D]) -> Double {
        guard points.count > 2 else {return 0}
        var length: CLLocationDistance = 0
        for i in 0 ..< points.count - 1 {
            let point1 = points[i]
            let point2 = points[i + 1]
            let location1 = CLLocation(latitude: point1.latitude, longitude: point1.longitude)
            let location2 = CLLocation(latitude: point2.latitude, longitude: point2.longitude)
            length += location1.distance(from: location2)
        }
        return length
    }
    
    func formatCurrentDistance() {
        currentDistance = calculatePolyLineLength(points: positions)
        formattedDistance = String(format: "%.2f", currentDistance) + " m."
    }
    
    private  func updateGoals() {
        DataStorage.shared.actualizeGoals(kcal: kcalPerSecond, distance: Int(lastSecondDistance), time: 1)
    }
    
    func calculateLastSecondDistance(currentDistance: Double, secondAgoDistance: Double) {
        lastSecondDistance = currentDistance - secondAgoDistance
        oneSecondAgoDistance = currentDistance
    }
}
