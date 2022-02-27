//
//  WeatherForTheWholeDayTableViewCell.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 06.12.2021.
//

import UIKit
import CoreLocation


class WeatherForTheWholeDayTableViewCell: UITableViewCell {
    
    static let identifierWeatherForTheWholeDayTableViewCell = "WeatherForTheWholeDayTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model: WeatherResponse?
    var currentLocation: CLLocation?
    let weatherResponse: WeatherResponseProtocol = WeatherResponseImplementation()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    private func configCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(WeekCollectionViewCell.self, forCellWithReuseIdentifier: WeekCollectionViewCell.identifierWeekCollectionViewCell)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherForTheWholeDayTableViewCell", bundle: nil)
    }
    
    // MARK: - API
    
    func locationCity(searchSity: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(searchSity) {[weak self] (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let latitude = placemarks?.first?.location?.coordinate.latitude,
               let longitude = placemarks?.first?.location?.coordinate.longitude {
                self?.weatherResponse.loadWeatherForecast(cityLat: latitude, cityLon: longitude,
                                                         completion: {[weak self] result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let list):
                            self?.model = list
                            self?.collectionView.reloadData()
                        case .failure:
                            self?.collectionView.reloadData()
                        }
                    }
                })
            }
        }
    }
    
    // MARK: - Setup cell
    
    func hourlyTemp(indexPath: IndexPath) -> String {
        let value = model?.hourly[indexPath.row].temp ?? 0
        let temp = " \(String(describing: lround(value)))°"
        return temp
    }
    
    func hourlyIcon(indexPath: IndexPath) -> UIImage? {
        let iconName = UIImage(named: "\(model?.hourly[indexPath.row].weather.first?.icon ?? "")")
        return iconName
    }
    
    // MARK: - Date Formater
    
    func hourlyDateFormater(indexPath: IndexPath) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(model?.hourly[indexPath.row].dt ?? 0))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "HH:mm"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
}
