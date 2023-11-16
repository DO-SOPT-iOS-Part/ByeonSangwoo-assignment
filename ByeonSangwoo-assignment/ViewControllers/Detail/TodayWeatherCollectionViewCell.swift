//
//  TodayWeatherCollectionViewCell.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/10/23.
//

import UIKit
import SnapKit
import Then

class TodayWeatherCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TodayWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStyle()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let time = UILabel()
    private let weatherImageView = UIImageView()
    private let temperature = UILabel()
    
    func todayWeatherbindData(data: TodayWeather) {
        self.time.text = data.time
        self.weatherImageView.image = UIImage(systemName: data.weatherImage)?.withRenderingMode(.alwaysOriginal)
        self.temperature.text = data.temperature
    }
    
    private func setStyle() {
        time.do {
            $0.font = UIFont.medium(size: 17)
        }
        
        weatherImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }
        
        temperature.do {
            $0.font = UIFont.medium(size: 22)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(time, weatherImageView, temperature)
        
        time.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(time.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        temperature.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
    }
}
