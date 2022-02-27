//
//  WeekCollectionViewCell.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 06.12.2021.
//

import UIKit


class WeekCollectionViewCell: UICollectionViewCell {
 
    static let identifierWeekCollectionViewCell = "WeekCollectionViewCell"
    
    let time: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    let iconWeather: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    let temperature: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 25,weight: .medium)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    func configText() {
        contentView.addSubview(time)
        contentView.addSubview(iconWeather)
        contentView.addSubview(temperature)
        
        time.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(iconWeather.snp.top).offset(-10)
        }
        
        iconWeather.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        temperature.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(iconWeather.snp.bottom).offset(10)
        }
    }
}
