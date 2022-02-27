import UIKit
import SnapKit


class CurrentWeatherTableViewCell: UITableViewCell {
    
    static let identifierCurrentWeatherTableViewCel = "CurrentWeatherTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CurrentWeatherTableViewCell", bundle: nil)
    }
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 25
        return view
    }()
    
    var cityName: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        text.textAlignment = .center
        text.textColor = .white
        text.numberOfLines = 0
        return text
    }()
    
    var temperatureLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 70)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var descriptionWeather: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
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
        configCityName()
        configTemperatureLabel()
        configDescriptionWeather()
    }
    
    private func configContainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configCityName() {
        containerView.addSubview(cityName)
        cityName.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
    }
    
    private func configTemperatureLabel() {
        containerView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cityName.snp.bottom)
        }
    }
    
    private func configDescriptionWeather() {
        containerView.addSubview(descriptionWeather)
        descriptionWeather.snp.makeConstraints { make in
            make.centerX.bottom.equalToSuperview().inset(20)
            make.top.equalTo(temperatureLabel.snp.bottom)
        }
    }
}
