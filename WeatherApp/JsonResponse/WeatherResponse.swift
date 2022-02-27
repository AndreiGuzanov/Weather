//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 09.12.2021.
//

import Foundation


// MARK: - WeatherResponse

struct WeatherResponse: Codable {
    let current: Current
    let hourly: [Current]
    let daily: [Daily]
}

// MARK: - Current

struct Current: Codable {
    let dt: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let uvi: Double
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [Weather]
    let pop: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case uvi
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, pop
    }
}

// MARK: - Weather

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - Daily

struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [Weather]
    let pop: Double
    let uvi: Double
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, pop, uvi
    }
}

// MARK: - FeelsLike

struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp

struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
