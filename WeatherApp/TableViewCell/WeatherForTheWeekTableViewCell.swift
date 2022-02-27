//
//  WeatherForTheWeekTableViewCell.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 01.02.2022.
//

import UIKit
import SnapKit


class WeatherForTheWeekTableViewCell: UITableViewCell {
    
    static let identifierWeatherForTheWeekTableViewCell = "WeatherForTheWeekTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherForTheWeekTableViewCell", bundle: nil)
    }
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 25
        return view
    }()
    
    let dayOfTheWeekLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textLabel.textAlignment = .left
        textLabel.textColor = .white
        textLabel.numberOfLines = 0
        return textLabel
    }()
    
    let iconWeather: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    let temperatureDayLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textLabel.textAlignment = .right
        textLabel.textColor = .white
        return textLabel
    }()
    
    let temperatureNightLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textLabel.textAlignment = .right
        textLabel.textColor = .white
        return textLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    private func configCell() {
        configContainerView()
        configDayOfTheWeek()
        configIconWeather()
        configTemperatureDayLabel()
        configTemperatureNightLabel()
    }
    
    private func configContainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configDayOfTheWeek() {
        containerView.addSubview(dayOfTheWeekLabel)
        dayOfTheWeekLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.center.equalToSuperview()
        }
    }
    
    private func configIconWeather() {
        containerView.addSubview(iconWeather)
        iconWeather.snp.makeConstraints { make in
            make.right.equalTo(snp.centerX)
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    private func configTemperatureDayLabel() {
        containerView.addSubview(temperatureDayLabel)
        temperatureDayLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(50)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configTemperatureNightLabel() {
        containerView.addSubview(temperatureNightLabel)
        temperatureNightLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
}
