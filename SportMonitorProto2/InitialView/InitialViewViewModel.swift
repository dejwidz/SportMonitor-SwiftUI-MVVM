//
//  InitialViewViewModel.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 03/02/2024.
//

import Foundation
import SwiftUI

protocol InitialViewViewModelProtocol: ObservableObject {
    func start()
    var isGoingInside: [Bool] { get set }
    var goOut: [Bool] { get set }
    var blowOut: Bool { get set }
    var normalSpeed: Bool { get set }
    var fast: Bool { get set }
    var speed: Double { get set }
    var showMainImage: Bool { get set }
    var goToMainView: Bool { get set }
}

final class InitialViewViewModel: InitialViewViewModelProtocol {
    
    @Published var blowOut: Bool = false
    @Published var speed: Double  = 0.2
    @Published var showMainImage: Bool = false
    @Published var isGoingInside: [Bool] = Array(repeating: false, count: 52)
    @Published var normalSpeed = true
    @Published var fast = true
    @Published var goToMainView = false
    @Published var goOut: [Bool] = Array(repeating: false, count: 50)
    

    private var counter = 0
    private var timer: Timer?
    
    typealias Completion = () -> Void
    
    init() {}
    
    func start() {
        var index = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            index = Int.random(in: 0...self.isGoingInside.count - 1)
            self.isGoingInside[index] = true
            if !self.isGoingInside.contains(false) {
                self.stopTimer()
                self.executeWithDelay(delay: 1) {
                    self.conductAnimation()
                }
            }
        }
    }
    
    func conductAnimation() {
        counter = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.counter += 1
            
            if self.counter == 3 {
                self.speed = 0.3
                self.blowOut = true
                self.showMainImage = true
            }
            if self.counter == 5 {
                self.goToMainView = true
                self.stopTimer()
            }
        }
    }
    
    func executeWithDelay(delay: Double, handler: @escaping Completion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            handler()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
