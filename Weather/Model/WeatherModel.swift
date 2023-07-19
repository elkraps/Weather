//
//  WeatherModel.swift
//  Weather
//
//  Created by Vlad Dzirko on 19.07.2023.
//

import Foundation


public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
