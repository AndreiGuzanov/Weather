//
//  WeatherResponseImplementation.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 21.12.2021.
//

import UIKit


class WeatherResponseImplementation: WeatherResponseProtocol {
    
    func prepareLoadDataRequest(cityLat: Double, cityLon: Double) -> URL? {
        var components = URLComponents(string: DataApi.baseUrl)
        components?.queryItems = [URLQueryItem(name: Parameters.lat, value: "\(cityLat)"),
                                  URLQueryItem(name: Parameters.lon, value: "\(cityLon)"),
                                  URLQueryItem(name: Parameters.units, value: Parameters.metric),
                                  URLQueryItem(name: Parameters.appid, value: DataApi.apiKey)]
        return components?.url
    }
    
    func loadWeatherForecast(cityLat: Double, cityLon: Double, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let session = URLSession.shared
        let request: URLRequest = URLRequest(url: prepareLoadDataRequest(cityLat: cityLat, cityLon: cityLon)!)
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            do {
                let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(response))
            } catch (let error) {
                completion(.failure(error))
            }
        })
        task.resume()
    }
}

enum ApiError: Error {
    case noData
}
