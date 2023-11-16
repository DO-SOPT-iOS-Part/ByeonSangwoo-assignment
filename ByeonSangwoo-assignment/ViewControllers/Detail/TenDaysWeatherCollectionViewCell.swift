//
//  TenDaysWeatherCollectionViewCell.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/10/23.
//

import UIKit
import SnapKit
import Then

class TenDaysWeatherCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TenDaysWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStyle()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let day = UILabel()
    private let weatherIconImage = UIImageView()
    private let predictPercent = UILabel()
    private let tempMin = UILabel()
    private let tempImage = UIImageView()
    private let tempMax = UILabel()
    
    func tenDaysWeatherBindData(data: TenDaysWeather) {
        self.day.text = data.day
        self.weatherIconImage.image = UIImage(systemName: data.weatherIconImage)?.withRenderingMode(.alwaysOriginal)
        self.predictPercent.text = data.predictPercent
        self.tempMin.text = data.tempMin
        self.tempImage.image = UIImage(named: data.tempImage)
        self.tempMax.text = data.tempMax
    }
    
    private func setStyle() {
        day.do {
            $0.font = UIFont.medium(size: 22)
        }
        
        weatherIconImage.do {
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }
        
        predictPercent.do {
            $0.font = UIFont.bold(size: 15)
        }
        
        tempMin.do {
            $0.font = UIFont.medium(size: 22)
            $0.textColor = .lightGray
        }
        
        tempImage.do {
            $0.contentMode = .scaleAspectFit
        }
        
        tempMax.do {
            $0.font = UIFont.medium(size: 22)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(day, weatherIconImage, tempMin, tempImage, tempMax)
        
        day.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(26)
        }
        
        weatherIconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(100)
            $0.height.equalTo(25)
        }
        
        tempMin.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        tempImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(tempMax.snp.leading).offset(-8)
            $0.width.equalTo(100)
        }
        
        tempMax.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
    }
}
