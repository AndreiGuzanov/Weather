//
//  WeatherResponseProtocol.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 21.12.2021.
//

import UIKit


protocol WeatherResponseProtocol {
    func loadWeatherForecast(cityLat: Double, cityLon: Double, completion: @escaping (Result<WeatherResponse, Error>) -> Void)
    func prepareLoadDataRequest(cityLat: Double, cityLon: Double) -> URL?
}
