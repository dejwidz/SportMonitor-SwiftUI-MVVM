//
//  Enums.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 10/09/2023.
//

import Foundation


enum Sports: Identifiable {
    
    case Alpinism
    case AquaFitness
    case Badminton
    case Baseball
    case Jogging
    case Bilard
    case Box
    case Walking
    case Fitness
    case Gym
    case AmericanFootball
    case Gymnastics
    case Golf
    case Hockey
    case HorseRiding
    case Yoga
    case Kitesurfing
    case Basketball
    case Hunting
    case Skiing
    case NordicWalking
    case Diving
    case Football
    case Swimming
    case PoleDance
    case Cycling
    case Rugby
    case Volleyball
    case SkiTouring
    case Snorkeling
    case Snowboard
    case MartialArts
    case Squash
    case Surfing
    case Dancing
    case Tenis
    case Trekking
    case Wakeboarding
    case Waterpolo
    case Windsurfing
    
    var id: String {
        switch self {
        case .Alpinism:
            return "Alpinism"
        case .AquaFitness:
            return "Aquafitness"
        case .Badminton:
            return "Badminton"
        case .Baseball:
            return "Baseball"
        case .Jogging:
            return "Jogging"
        case .Bilard:
            return "Bilard"
        case .Box:
            return "Box"
        case .Walking:
            return "Walking"
        case .Fitness:
            return "Fitness"
        case .Gym:
            return "Gym"
        case .AmericanFootball:
            return "American football"
        case .Gymnastics:
            return "Gymnastics"
        case .Golf:
            return "Golf"
        case .Hockey:
            return "Hockey"
        case .HorseRiding:
            return "Horse riding"
        case .Yoga:
            return "Joga"
        case .Kitesurfing:
            return "Kitesurfing"
        case .Basketball:
            return "Basketball"
        case .Hunting:
            return "Hunting"
        case .Skiing:
            return "Skiing"
        case .NordicWalking:
            return "Nordic walking"
        case .Diving:
            return "Diving"
        case .Football:
            return "Football"
        case .Swimming:
            return "Swimming"
        case .PoleDance:
            return "Pole dance"
        case .Cycling:
            return "Cycling"
        case .Rugby:
            return "Rugby"
        case .Volleyball:
            return "Volleyball"
        case .SkiTouring:
            return "Skituring"
        case .Snorkeling:
            return "Snorkeling"
        case .Snowboard:
            return "Snowboard"
        case .MartialArts:
            return "Martial arts"
        case .Squash:
            return "Squash"
        case .Surfing:
            return "Surfing"
        case .Dancing:
            return "Dancing"
        case .Tenis:
            return "Tenis"
        case .Trekking:
            return "Trekking"
        case .Wakeboarding:
            return "Wakeboarding"
        case .Waterpolo:
            return "Waterpolo"
        case .Windsurfing:
            return "Windsurfing"
        }
    }
    
    var kcalPerHour: Double {
        switch self {
        case .Alpinism:
            return 560
        case .AquaFitness:
            return 385
        case .Badminton:
            return 425
        case .Baseball:
            return 350
        case .Jogging:
            return 385
        case .Bilard:
            return 168
        case .Box:
            return 650
        case .Walking:
            return 220
        case .Fitness:
            return 560
        case .Gym:
            return 500
        case .AmericanFootball:
            return 600
        case .Gymnastics:
            return 320
        case .Golf:
            return 315
        case .Hockey:
            return 500
        case .HorseRiding:
            return 280
        case .Yoga:
            return 175
        case .Kitesurfing:
            return 770
        case .Basketball:
            return 560
        case .Hunting:
            return 220
        case .Skiing:
            return 480
        case .NordicWalking:
            return 400
        case .Diving:
            return 600
        case .Football:
            return 650
        case .Swimming:
            return 700
        case .PoleDance:
            return 560
        case .Cycling:
            return 560
        case .Rugby:
            return 630
        case .Volleyball:
            return 280
        case .SkiTouring:
            return 450
        case .Snorkeling:
            return 350
        case .Snowboard:
            return 400
        case .MartialArts:
            return 510
        case .Squash:
            return 600
        case .Surfing:
            return 350
        case .Dancing:
            return 500
        case .Tenis:
            return 450
        case .Trekking:
            return 370
        case .Wakeboarding:
            return 210
        case .Waterpolo:
            return 700
        case .Windsurfing:
            return 350
        }
    }
    
    var navigationPossibility: Bool {
        switch self {
        case .Alpinism:
            return false
        case .AquaFitness:
            return false
        case .Badminton:
            return false
        case .Baseball:
            return false
        case .Jogging:
            return false
        case .Bilard:
            return false
        case .Box:
            return false
        case .Walking:
            return true
        case .Fitness:
            return false
        case .Gym:
            return false
        case .AmericanFootball:
            return false
        case .Gymnastics:
            return false
        case .Golf:
            return false
        case .Hockey:
            return false
        case .HorseRiding:
            return true
        case .Yoga:
            return false
        case .Kitesurfing:
            return false
        case .Basketball:
            return false
        case .Hunting:
            return true
        case .Skiing:
            return true
        case .NordicWalking:
            return false
        case .Diving:
            return false
        case .Football:
            return false
        case .Swimming:
            return true
        case .PoleDance:
            return false
        case .Cycling:
            return true
        case .Rugby:
            return false
        case .Volleyball:
            return false
        case .SkiTouring:
            return true
        case .Snorkeling:
            return false
        case .Snowboard:
            return false
        case .MartialArts:
            return false
        case .Squash:
            return false
        case .Surfing:
            return false
        case .Dancing:
            return false
        case .Tenis:
            return false
        case .Trekking:
            return true
        case .Wakeboarding:
            return false
        case .Waterpolo:
            return false
        case .Windsurfing:
            return true
        }
    }
}

struct SportSelection: Identifiable {
    let id = UUID()
    let sport: Sports
    static let sportSelections: [SportSelection] = [
        SportSelection(sport: .Alpinism),
        SportSelection(sport: .AmericanFootball),
        SportSelection(sport: .AquaFitness),
        SportSelection(sport: .Badminton),
        SportSelection(sport: .Baseball),
        SportSelection(sport: .Basketball),
        SportSelection(sport: .Bilard),
        SportSelection(sport: .Box),
        SportSelection(sport: .Cycling),
        SportSelection(sport: .Dancing),
        SportSelection(sport: .Diving),
        SportSelection(sport: .Fitness),
        SportSelection(sport: .Football),
        SportSelection(sport: .Golf),
        SportSelection(sport: .Gym),
        SportSelection(sport: .Gymnastics),
        SportSelection(sport: .Hockey),
        SportSelection(sport: .HorseRiding),
        SportSelection(sport: .Hunting),
        SportSelection(sport: .Jogging),
        SportSelection(sport: .Jogging),
        SportSelection(sport: .Kitesurfing),
        SportSelection(sport: .MartialArts),
        SportSelection(sport: .NordicWalking),
        SportSelection(sport: .PoleDance),
        SportSelection(sport: .Rugby),
        SportSelection(sport: .SkiTouring),
        SportSelection(sport: .Skiing),
        SportSelection(sport: .Snorkeling),
        SportSelection(sport: .Snowboard),
        SportSelection(sport: .Squash),
        SportSelection(sport: .Surfing),
        SportSelection(sport: .Swimming),
        SportSelection(sport: .Tenis),
        SportSelection(sport: .Trekking),
        SportSelection(sport: .Volleyball),
        SportSelection(sport: .Wakeboarding),
        SportSelection(sport: .Walking),
        SportSelection(sport: .Waterpolo),
        SportSelection(sport: .Windsurfing),
        SportSelection(sport: .Yoga)
    ]
}

enum GoalTypes: Identifiable {
    case kcal
    case distance
    case time
    
    var id: String {
        switch self {
        case .kcal:
            return "kcal"
        case .distance:
            return "distance"
        case .time:
            return "time"
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
