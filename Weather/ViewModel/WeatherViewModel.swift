//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Vlad Dzirko on 19.07.2023.
//

import Foundation

private let defaultIcon = "❓"
private let iconMap = [
    "Drizzle" : "🌧️",
    "Thunderstorm" : "⛈️",
    "Rain" : "🌧️",
    "Snow" : "❄️",
    "Clear" : "☀️",
    "Clouds" : "☁️",
]


public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temprature: String = "--"
    @Published var weatherDesription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temprature = "\(weather.temperature)°С"
                self.weatherDesription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
