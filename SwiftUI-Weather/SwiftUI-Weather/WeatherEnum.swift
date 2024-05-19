//
//  WeatherModel.swift
//  SwiftUI-Weather
//
//  Created by Gerard on 4/3/24.
//

import Foundation

enum WeatherStatus {
    case sunny
    case windy
    case rainy
    case cloudy
    case cloudySun
    
    func imageName() -> String {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .windy:
            return "wind.snow"
        case .rainy:
            return "cloud.rain.fill"
        case .cloudy:
            return "cloud.fill"
        case .cloudySun:
            return "cloud.sun.fill"
        }
    }
    
    func temp() -> Int {
        switch self {
        case .sunny:
            return 40
        case .windy:
            return 30
        case .rainy:
            return 20
        case .cloudy:
            return 25
        case .cloudySun:
            return 35
        }
    }
}
