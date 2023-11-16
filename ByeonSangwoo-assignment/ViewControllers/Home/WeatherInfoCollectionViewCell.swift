//
//  WeatherInfoCollectionViewCell.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/9/23.
//

import UIKit
import SnapKit
import Then

class WeatherInfoCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "WeatherInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStyle()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let title = UILabel()
    private let subTitle = UILabel()
    private let temperature = UILabel()
    private let weather = UILabel()
    private let tempMaxMin = UILabel()
    private let imageView = UIImageView()
    
    func bindData(data: WeatherDataModel) {
        if let korean = CountryName(rawValue: data.name) {
            let koreanCountry = korean.translatedKorean()
            self.title.text = koreanCountry
        }
        self.subTitle.text = convertTime(timezone: data.timezone)
        self.temperature.text = "\(Int(data.main.temp - 273.15))°"
        self.weather.text = String(data.weather[0].description)
        self.tempMaxMin.text = "최고:\(Int(data.main.tempMax - 273.15))° 최저:\(Int(data.main.tempMin - 273.15))°"
        self.imageView.image = UIImage(named: "cellBackground")
    }
    
    func convertTime(timezone: Int) -> String {
        let timeZone = TimeZone(secondsFromGMT: timezone)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "a h:mm"
        dateFormatter.timeZone = timeZone
        let currentDate = Date()
        let formattedTime = dateFormatter.string(from: currentDate)
        return formattedTime
    }
    
    private func setStyle() {
        title.do {
            $0.font = UIFont.bold(size: 24)
        }
        
        subTitle.do {
            $0.font = UIFont.medium(size: 17)
        }
        
        temperature.do {
            $0.font = UIFont.light(size: 52)
        }
        
        weather.do {
            $0.font = UIFont.medium(size: 16)
        }
        
        tempMaxMin.do {
            $0.font = UIFont.medium(size: 15)
        }
    }
    
    private func setLayout() {
        self.contentView.addSubviews(title, subTitle, temperature, weather, tempMaxMin)
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        subTitle.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(2)
            $0.leading.equalTo(title.snp.leading)
        }
        
        temperature.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        weather.snp.makeConstraints {
            $0.top.equalTo(subTitle.snp.bottom).offset(23)
            $0.leading.equalTo(subTitle.snp.leading)
        }
        
        tempMaxMin.snp.makeConstraints {
            $0.top.equalTo(weather.snp.top)
            $0.trailing.equalTo(temperature.snp.trailing)
        }
    }
}
