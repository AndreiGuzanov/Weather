//
//  CurrentWeatherParametersTableViewCell.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 15.02.2022.
//

import UIKit
import SnapKit


class CurrentWeatherParametersTableViewCell: UITableViewCell {

static let identifierCurrentWeatherParameters = "CurrentWeatherParametersTableViewCell"

static func nib() -> UINib {
    return UINib(nibName: "CurrentWeatherParametersTableViewCell", bundle: nil)
}
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 25
        return view
    }()
    
    var parameterName: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        text.textAlignment = .left
        text.textColor = .white
        text.numberOfLines = 0
        return text
    }()
        
    let iconWeather: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleToFill
        return icon
    }()
    
    var parameterValue: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 30)
        text.textAlignment = .left
        text.textColor = .white
        return text
    }()
        
    var firstLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 15)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var secondLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 15)
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
        configParameterName()
        configIconWeather()
        configParameterValue()
        configFirstLabel()
        configSecondLabel()
    }
    
    private func configContainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configParameterName() {
        containerView.addSubview(parameterName)
        parameterName.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview()
        }
    }
    
    private func configIconWeather() {
        containerView.addSubview(iconWeather)
        iconWeather.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
            make.top.equalTo(parameterName.snp.bottom)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    private func configParameterValue() {
        containerView.addSubview(parameterValue)
        parameterValue.snp.makeConstraints { make in
            make.left.equalTo(iconWeather.snp.right).offset(10)
            make.bottom.equalToSuperview()
            make.top.equalTo(parameterName.snp.bottom)
        }
    }
    
    private func configFirstLabel() {
        containerView.addSubview(firstLabel)
        firstLabel.snp.makeConstraints { make in
            make.left.equalTo(snp.centerX).offset(30)
            make.top.equalToSuperview().inset(5)
        }
    }
    
    private func configSecondLabel() {
        containerView.addSubview(secondLabel)
        secondLabel.snp.makeConstraints { make in
            make.left.equalTo(snp.centerX).offset(30)
            make.bottom.equalToSuperview().inset(5)
        }
    }
}
