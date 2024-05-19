//
//  WeatherModel.swift
//  SwiftUI-Weather
//
//  Created by Gerard on 4/3/24.
//

import Foundation

struct WeatherModel: Identifiable {
    var id = UUID()
    
    let dayOfWeek: String
    let imageName: String
    let temp: Int
}

class WeatherViewModel: ObservableObject {
    @Published var items: [WeatherModel] = [
        WeatherModel(dayOfWeek: "TUE", imageName: WeatherStatus.cloudySun.imageName(), temp: WeatherStatus.cloudySun.temp()),
        WeatherModel(dayOfWeek: "WED", imageName: WeatherStatus.cloudy.imageName(), temp: WeatherStatus.cloudy.temp()),
        WeatherModel(dayOfWeek: "THU", imageName: WeatherStatus.rainy.imageName(), temp: WeatherStatus.rainy.temp()),
        WeatherModel(dayOfWeek: "FRI", imageName: WeatherStatus.sunny.imageName(), temp: WeatherStatus.sunny.temp()),
        WeatherModel(dayOfWeek: "SAT", imageName: WeatherStatus.windy.imageName(), temp: WeatherStatus.windy.temp())
    ]
}
