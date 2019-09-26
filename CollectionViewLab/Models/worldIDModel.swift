//
//  worldIDModel.swift
//  CollectionViewLab
//
//  Created by Phoenix McKnight on 9/26/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import  UIKit

struct WeatherWrapper: Codable {
  let consolidatedWeather: [ConsolidatedWeather]

}

// MARK: - ConsolidatedWeather
struct ConsolidatedWeather: Codable {
    let id: Int
    let weatherStateName, weatherStateAbbr, created: String
    let minTemp, maxTemp, theTemp, windSpeed: Double
    let humidity: Int
    let visibility: Double
    let predictability: Int

    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case created
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case humidity, visibility, predictability
    }
}
