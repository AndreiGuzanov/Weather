//
//  DayOfTheWeekDataViewController + Extension.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 18.02.2022.
//

import UIKit


extension DayOfTheWeekDataViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        backgroundColorScreenController(indexPath: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ModelDayOfTheWeekDataTableViewCell.identifierModelDayOfTheWeekData, for: indexPath) as? ModelDayOfTheWeekDataTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.dateNameLabel.text = dateNameLabel
        cell.timeOfDayLabel.text = timeOfDayLabel
        cell.temperatureDayLabel.text = temperatureDayLabel
        cell.temperatureNightLabel.text = temperatureNightLabel
        cell.iconWeather.image = iconWeather
        cell.descriptionWeatherLabel.text = descriptionWeatherLabel
        cell.feelsLikeLabel.text = feelsLikeLabel
        cell.indexUvLabel.text = indexUvLabel
        cell.windSpeedLabel.text = windSpeedLabel
        cell.humidityLabel.text = humidityLabel
        return cell
    }
}
