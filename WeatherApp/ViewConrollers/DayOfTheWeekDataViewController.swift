//
//  DayOfTheWeekDataViewController.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 17.02.2022.
//

import UIKit
import SpriteKit


class DayOfTheWeekDataViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SKView!
    @IBOutlet weak var tableView: UITableView!
    
    let iconDic = IconModel()
    var iconName = ""
    var dateNameLabel = ""
    var timeOfDayLabel = "Day"
    var temperatureDayLabel = ""
    var temperatureNightLabel = ""
    var iconWeather = UIImage()
    var descriptionWeatherLabel = ""
    var feelsLikeLabel = ""
    var indexUvLabel = ""
    var windSpeedLabel = ""
    var humidityLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - BackgroundScreenViewController
    
    func backgroundColorScreenController(indexPath: IndexPath) {
        let iconName = iconName
        for icon in iconDic.iconsDictionary {
            if icon.key == iconName {
                let sceneName = SKScene(fileNamed: icon.value)
                sceneView.presentScene(sceneName)
            }
        }
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.register(ModelDayOfTheWeekDataTableViewCell.nib(), forCellReuseIdentifier: ModelDayOfTheWeekDataTableViewCell.identifierModelDayOfTheWeekData)
    }
    
    @IBAction func goBackToMainScreen(_ sender: Any) {
        
    }
    
    func setupModelDay(dateName: String, tempDay: String, tempNight: String, icon: UIImage, descriptionWeather: String, feelsLike: String, indexUv: String, windSpeed: String, humidity: String) {
        dateNameLabel = dateName
        temperatureDayLabel = tempDay
        temperatureNightLabel = tempNight
        iconWeather = icon
        descriptionWeatherLabel = descriptionWeather
        feelsLikeLabel = feelsLike
        indexUvLabel = indexUv
        windSpeedLabel = windSpeed
        humidityLabel = humidity
    }
}
