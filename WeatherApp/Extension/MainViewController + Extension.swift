//
//  MainViewController + Extension.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 02.12.2021.
//

import UIKit


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - DataSourceTableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if ((model?.current.weather.isEmpty) != nil) {
            return 3
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return model?.daily.count ?? 0
        case 2:
            return 2
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            backgroundSceneViewController()
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrentWeatherTableViewCell.identifierCurrentWeatherTableViewCel, for: indexPath) as? CurrentWeatherTableViewCell else { return UITableViewCell() }
                    cell.backgroundColor = .clear
                    cell.cityName.text = city()
                    cell.temperatureLabel.text = currentTemp()
                    cell.descriptionWeather.text = currentDescript()
                    return cell
                case 1:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherForTheWholeDayTableViewCell.identifierWeatherForTheWholeDayTableViewCell, for: indexPath) as? WeatherForTheWholeDayTableViewCell else { return UITableViewCell() }
                    cell.locationCity(searchSity: city())
                    return cell
                default:
                    break
                }
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherForTheWeekTableViewCell.identifierWeatherForTheWeekTableViewCell, for: indexPath) as? WeatherForTheWeekTableViewCell else { return UITableViewCell() }
                cell.accessoryType = .detailDisclosureButton
                cell.backgroundColor = .clear
                cell.dayOfTheWeekLabel.text = dailyDateFormater(indexPath: indexPath)
                cell.temperatureNightLabel.text = dailyTempNight(indexPath: indexPath)
                cell.temperatureDayLabel.text = dailyTempDay(indexPath: indexPath)
                cell.iconWeather.image = dailyIcon(indexPath: indexPath) ?? UIImage()
                return cell
            case 2:
                switch indexPath.row {
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrentWeatherParametersTableViewCell.identifierCurrentWeatherParameters, for: indexPath) as? CurrentWeatherParametersTableViewCell else { return UITableViewCell() }
                    cell.backgroundColor = .clear
                    cell.parameterName.text = currentParameterName()
                    cell.iconWeather.image = currentHumidityIcon() ?? UIImage()
                    cell.parameterValue.text = currentHumidity()
                    cell.firstLabel.text = currentFeelsLike()
                    cell.secondLabel.text = currentIndexUvi()
                    return cell
                case 1:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrentWeatherParametersTableViewCell.identifierCurrentWeatherParameters, for: indexPath) as? CurrentWeatherParametersTableViewCell else { return UITableViewCell() }
                    cell.backgroundColor = .clear
                    cell.parameterName.text = currentWind()
                    cell.iconWeather.image = currentWindIcon() ?? UIImage()
                    cell.parameterValue.text = currentWindSpeed()
                    cell.firstLabel.text = currentWindDirection()
                    cell.secondLabel.text = currentWindGust()
                    return cell
                default:
                    break
                }
            default:
                break
            }
        return UITableViewCell()
    }
    
    // MARK: - TableViewDelegate
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "DayOfTheWeekDataViewController") as? DayOfTheWeekDataViewController {
            controller.setupModelDay(dateName: dailyDateFormater(indexPath: indexPath), tempDay: dailyTempDay(indexPath: indexPath), tempNight: dailyTempNight(indexPath: indexPath), icon: dailyIcon(indexPath: indexPath) ?? UIImage(), descriptionWeather: dailyDescription(indexPath: indexPath), feelsLike: dailyFeelsLike(indexPath: indexPath), indexUv: dailyIndexUvi(indexPath: indexPath), windSpeed: dailyWindSpeed(indexPath: indexPath), humidity: dailyHumidity(indexPath: indexPath))
            controller.iconName = dailyIconName(indexPath: indexPath) ?? ""
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
