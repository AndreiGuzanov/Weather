//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 02.12.2021.
//

import UIKit
import CoreLocation
import SpriteKit


class MainViewController: UIViewController, CLLocationManagerDelegate  {
    
    @IBOutlet weak var sceneView: SKView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    let node = SKEmitterNode()
    var currentLocation: CLLocation?
    var currentCity = ""
    var model: WeatherResponse?
    let locationManager = CLLocationManager()
    let weatherResponse: WeatherResponseProtocol = WeatherResponseImplementation()
    let iconDic = IconModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLocation()
        configTableView()
    }
    
    // MARK: - BackgroundSceneViewController
    
    func backgroundSceneViewController() {
        let iconName = model?.current.weather.first?.icon
        for scene in iconDic.iconsDictionary {
            if scene.key == iconName {
                let sceneName = SKScene(fileNamed: scene.value)
                sceneView.presentScene(sceneName)
            }
        }
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CurrentWeatherTableViewCell.nib(), forCellReuseIdentifier: CurrentWeatherTableViewCell.identifierCurrentWeatherTableViewCel)
        tableView.register(WeatherForTheWholeDayTableViewCell.nib(), forCellReuseIdentifier: WeatherForTheWholeDayTableViewCell.identifierWeatherForTheWholeDayTableViewCell)
        tableView.register(WeatherForTheWeekTableViewCell.nib(), forCellReuseIdentifier: WeatherForTheWeekTableViewCell.identifierWeatherForTheWeekTableViewCell)
        tableView.register(CurrentWeatherParametersTableViewCell.nib(), forCellReuseIdentifier: CurrentWeatherParametersTableViewCell.identifierCurrentWeatherParameters)
    }
    
    // MARK: - DelegateLocation
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil  {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    // MARK: - Location
    
    private func configLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - API
    
    func searchCity(searchSity: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(searchSity) {[weak self] (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let latitude = placemarks?.first?.location?.coordinate.latitude,
               let longitude = placemarks?.first?.location?.coordinate.longitude {
                self?.showLoading()
                self?.weatherResponse.loadWeatherForecast(cityLat: latitude, cityLon: longitude, completion: {[weak self] result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let list):
                            self?.model = list
                            self?.tableView.reloadData()
                            self?.showData()
                        case .failure:
                            self?.tableView.reloadData()
                            self?.showError()
                        }
                    }
                })
            }
        }
    }
    
    private func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else { return }
        let latitude = currentLocation.coordinate.latitude
        let longitude = currentLocation.coordinate.longitude
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geoCoder.reverseGeocodeLocation(location) {[weak self] placemarks, error in
            guard let placeMark = placemarks?.first else { return }
            if let city = placeMark.subAdministrativeArea {
                if self?.currentCity == "" {
                    self?.currentCity = city
                    self?.showLoading()
                    self?.weatherResponse.loadWeatherForecast(cityLat: latitude, cityLon: longitude, completion: {[weak self] result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let list):
                                self?.model = list
                                self?.tableView.reloadData()
                                self?.showData()
                            case .failure:
                                self?.tableView.reloadData()
                                self?.showError()
                            }
                        }
                    })
                }
            }
        }
    }
    
    private func showLoading() {
        activityIndicatorView.startAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    private func showError() {
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = false
        reloadButton.isHidden = false
    }
    
    private func showData() {
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    // MARK: - Actions
    
    @IBAction func onReloadButtonClick(_ sender: Any) {
        requestWeatherForLocation()
    }
    
    @IBAction func actionAddCity(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SearcherViewController") as? SearcherViewController {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    // MARK: - Config cell
    
    func city() -> String {
        let city = currentCity
        return city
    }
    
    func currentDescript() -> String {
        let descript = " \(String(describing: model?.current.weather.first?.description ?? ""))"
        return descript
    }
    
    func currentTemp() -> String {
        let value = model?.current.temp ?? 0
        let temp = " \(String(describing: lround(value)))°"
        return temp
    }
    
    func currentParameterName() -> String {
        let name = "Humidity"
        return name
    }
    
    func currentHumidityIcon() -> UIImage? {
        let iconName = UIImage(named: "humidity")
        return iconName
    }
    
    func currentHumidity() -> String {
        let humidity = "\(String(describing: model?.current.humidity ?? 0))%"
        return humidity
    }
    
    func currentFeelsLike() -> String {
        let value = model?.current.feelsLike ?? 0
        let weatherSense = "feels like \(String(describing: lround(value)))°"
        return weatherSense
    }
    
    func currentIndexUvi() -> String {
        let uvi = "index Uv \(String(describing: model?.current.uvi ?? 0))"
        return uvi
    }
    
    func currentWind() -> String {
        let name = "Wind speed"
        return name
    }
    
    func currentWindDirection() -> String {
        let direction = "direction \(String(describing: model?.current.windDeg ?? 0))°"
        return direction
    }
    
    func currentWindSpeed() -> String {
        let speed = "\(String(describing: model?.current.windSpeed ?? 0))"
        return speed
    }
    
    func currentWindGust() -> String {
        let speed = "gust \(String(describing: model?.current.windGust ?? 0)) km/h"
        return speed
    }
    
    func currentWindIcon() -> UIImage? {
        let iconName = UIImage(named: "wind")
        return iconName
    }
    
    func dailyTempDay(indexPath: IndexPath) -> String {
        let valueDay = model?.daily[indexPath.row].temp.day ?? 0
        let temp = " \(String(describing: lround(valueDay)))° / "
        return temp
    }
    
    func dailyTempNight(indexPath: IndexPath) -> String {
        let value = model?.daily[indexPath.row].temp.night ?? 0
        let temp = " \(String(describing: lround(value)))°"
        return temp
    }
    
    func dailyIcon(indexPath: IndexPath) -> UIImage? {
        let iconName = UIImage(named: "\(model?.daily[indexPath.row].weather.first?.icon ?? "")")
        return iconName
    }
    
    func dailyDescription(indexPath: IndexPath) -> String {
        let text = " \(String(describing: model?.daily[indexPath.row].weather.first?.description ?? ""))"
        return text
    }
    
    func dailyFeelsLike(indexPath: IndexPath) -> String {
        let value = model?.daily[indexPath.row].feelsLike.day ?? 0
        let weatherSense = "feels like \(String(describing: lround(value)))°"
        return weatherSense
    }
    
    func dailyIndexUvi(indexPath: IndexPath) -> String {
        let uvi = "index Uv \(String(describing: model?.daily[indexPath.row].uvi ?? 0))"
        return uvi
    }
    
    func dailyWindDirection(indexPath: IndexPath) -> String {
        let direction = "wind direction \(String(describing: model?.daily[indexPath.row].windDeg ?? 0))°"
        return direction
    }
    
    func dailyWindSpeed(indexPath: IndexPath) -> String {
        let speed = "wind speed \(String(describing: model?.daily[indexPath.row].windSpeed ?? 0)) km/h"
        return speed
    }
    
    func dailyHumidity(indexPath: IndexPath) -> String {
        let humidity = "humidity \(String(describing: model?.daily[indexPath.row].humidity ?? 0)) %"
        return humidity
    }
    
    func dailyIconName(indexPath: IndexPath) -> String? {
        let iconName =  model?.daily[indexPath.row].weather.first?.icon
        return iconName
    }
    
    // MARK: - Date Formater
    
    func dailyDateFormater(indexPath: IndexPath) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(model?.daily[indexPath.row].dt ?? 0))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "E, d MMM"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
}
