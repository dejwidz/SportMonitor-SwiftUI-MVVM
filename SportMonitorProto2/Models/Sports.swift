//
//  Enums.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 10/09/2023.
//

import Foundation


enum Sports: String, Identifiable, CaseIterable {
    
    case alpinism
    case aquaFitness
    case badminton
    case baseball
    case jogging
    case bilard
    case box
    case walking
    case fitness
    case gym
    case americanFootball
    case gymnastics
    case golf
    case hockey
    case horseRiding
    case yoga
    case kitesurfing
    case basketball
    case hunting
    case skiing
    case nordicWalking
    case diving
    case football
    case swimming
    case poleDance
    case cycling
    case rugby
    case volleyball
    case skiTouring
    case snorkeling
    case snowboard
    case martialArts
    case squash
    case surfing
    case dancing
    case tenis
    case trekking
    case wakeboarding
    case waterpolo
    case windsurfing
    
    var id: String {
        self.rawValue.lowercased()
    }
    
    var kcalPerHour: Double {
        switch self {
        case .alpinism:
            return 560
        case .aquaFitness:
            return 385
        case .badminton:
            return 425
        case .baseball:
            return 350
        case .jogging:
            return 385
        case .bilard:
            return 168
        case .box:
            return 650
        case .walking:
            return 220
        case .fitness:
            return 560
        case .gym:
            return 500
        case .americanFootball:
            return 600
        case .gymnastics:
            return 320
        case .golf:
            return 315
        case .hockey:
            return 500
        case .horseRiding:
            return 280
        case .yoga:
            return 175
        case .kitesurfing:
            return 770
        case .basketball:
            return 560
        case .hunting:
            return 220
        case .skiing:
            return 480
        case .nordicWalking:
            return 400
        case .diving:
            return 600
        case .football:
            return 650
        case .swimming:
            return 700
        case .poleDance:
            return 560
        case .cycling:
            return 560
        case .rugby:
            return 630
        case .volleyball:
            return 280
        case .skiTouring:
            return 450
        case .snorkeling:
            return 350
        case .snowboard:
            return 400
        case .martialArts:
            return 510
        case .squash:
            return 600
        case .surfing:
            return 350
        case .dancing:
            return 500
        case .tenis:
            return 450
        case .trekking:
            return 370
        case .wakeboarding:
            return 210
        case .waterpolo:
            return 700
        case .windsurfing:
            return 350
        }
    }
    
    var navigationPossibility: Bool {
        switch self {
        case .walking, .hunting, .skiing, .skiTouring, .horseRiding, .nordicWalking, .cycling, .trekking, .windsurfing:
            return true
        default:
            return false
        }
    }
}

infix operator ++

func ++(firstValue: Int, secondValue: Int) -> Int {
    let firstString = "\(firstValue)"
    let secondString = "\(secondValue)"
    let combinedString = firstString + secondString
    let combinedInteger = Int(combinedString)
    return combinedInteger!
}
