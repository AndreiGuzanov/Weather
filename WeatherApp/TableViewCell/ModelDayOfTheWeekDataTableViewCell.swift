//
//  ModelDayOfTheWeekDataTableViewCell.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 17.02.2022.
//

import UIKit
import SnapKit


class ModelDayOfTheWeekDataTableViewCell: UITableViewCell {
    
    static let identifierModelDayOfTheWeekData = "ModelDayOfTheWeekDataTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "ModelDayOfTheWeekDataTableViewCell", bundle: nil)
    }
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 25
        return view
    }()
    
    var dateNameLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        text.textAlignment = .left
        text.textColor = .white
        text.numberOfLines = 0
        return text
    }()
        
    let timeOfDayLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        text.textAlignment = .left
        text.textColor = .white
        text.numberOfLines = 0
        return text
    }()
        
    var temperatureDayLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let temperatureNightLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        textLabel.textAlignment = .right
        textLabel.textColor = .white
        return textLabel
    }()
    
    let iconWeather: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    var descriptionWeatherLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var feelsLikeLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var indexUvLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var windSpeedLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var humidityLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
   
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    private func configCell() {
        configContainerView()
        configDateNameLabel()
        configTimeOfDayLabel()
        configTemperatureDayLabel()
        configTemperatureNightLabel()
        configIconWeather()
        configDescriptionWeatherLabel()
        configFeelsLikeLabel()
        configIndexUvLabel()
        configWindSpeedLabel()
        configHumidityLabel()
    }
    
    private func configContainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configDateNameLabel() {
        containerView.addSubview(dateNameLabel)
        dateNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(50)
        }
    }
    
    private func configTimeOfDayLabel() {
        containerView.addSubview(timeOfDayLabel)
        timeOfDayLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateNameLabel.snp.bottom)
        }
    }
    
    private func configTemperatureDayLabel() {
        containerView.addSubview(temperatureDayLabel)
        temperatureDayLabel.snp.makeConstraints { make in
            make.right.equalTo(snp.centerX)
            make.top.equalTo(timeOfDayLabel.snp.bottom)
        }
    }
    
    private func configTemperatureNightLabel() {
        containerView.addSubview(temperatureNightLabel)
        temperatureNightLabel.snp.makeConstraints { make in
            make.left.equalTo(temperatureDayLabel.snp.right)
            make.centerY.equalTo(temperatureDayLabel)
        }
    }
    
    private func configIconWeather() {
        containerView.addSubview(iconWeather)
        iconWeather.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(temperatureDayLabel.snp.bottom)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    private func configDescriptionWeatherLabel() {
        containerView.addSubview(descriptionWeatherLabel)
        descriptionWeatherLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconWeather.snp.bottom)
        }
    }
    
    private func configFeelsLikeLabel() {
        containerView.addSubview(feelsLikeLabel)
        feelsLikeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionWeatherLabel.snp.bottom)
        }
    }
    
    private func configIndexUvLabel() {
        containerView.addSubview(indexUvLabel)
        indexUvLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(feelsLikeLabel.snp.bottom)
        }
    }
    
    private func configWindSpeedLabel() {
        containerView.addSubview(windSpeedLabel)
        windSpeedLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(indexUvLabel.snp.bottom)
        }
    }
    
    private func configHumidityLabel() {
        containerView.addSubview(humidityLabel)
        humidityLabel.snp.makeConstraints { make in
            make.centerX.bottom.equalToSuperview()
            make.top.equalTo(windSpeedLabel.snp.bottom)
        }
    }
}
