//
//  WeatherForAWeekTableViewCell + Extension.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 10.12.2021.
//

import UIKit
import CoreLocation


extension WeatherForTheWholeDayTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.hourly.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekCollectionViewCell.identifierWeekCollectionViewCell, for: indexPath) as? WeekCollectionViewCell else { return UICollectionViewCell() }
        cell.configText()
        cell.iconWeather.image = hourlyIcon(indexPath: indexPath)
        cell.temperature.text = hourlyTemp(indexPath: indexPath)
        cell.time.text = hourlyDateFormater(indexPath: indexPath)
        cell.backgroundColor = .clear
        return cell
    }
    
    // MARK: - Flow layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: contentView.frame.width / 3.5, height: collectionView.frame.height - 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
}
