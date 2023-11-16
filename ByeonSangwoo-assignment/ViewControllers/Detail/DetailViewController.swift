//
//  DetailViewController.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/10/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedItem: WeatherDataModel?
    var index: Int = 0
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private let backgroundImageView = UIImageView()
    
    private let location = UILabel()
    private let temperature = UILabel()
    private let weather = UILabel()
    private let tempMaxMin = UILabel()
    
    // TodayWeather
    private let todayWeatherContainer = UIView()
    private let todayWeatherSummary = UILabel()
    private let divider = UIView()
    private let todayWeatherCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // TenDaysWeather
    private let tenDaysWeatherContainer = UIView()
    private let calendarIconImage = UIImageView()
    private let tenDaysTitle = UILabel()
    private let tenDaysCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewConfig()
        setCollectionViewLayout()
        setStyle()
        setLayout()
    }
    
    private func setCollectionViewLayout() {
        let flowLayout1 = UICollectionViewFlowLayout()
        flowLayout1.itemSize = CGSize(width: 44, height: 146)
        flowLayout1.minimumLineSpacing = 20
        flowLayout1.scrollDirection = .horizontal
        self.todayWeatherCollectionView.setCollectionViewLayout(flowLayout1, animated: false)
        
        let flowLayout2 = UICollectionViewFlowLayout()
        flowLayout2.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 55)
        flowLayout2.minimumLineSpacing = 0
        
        self.tenDaysCollectionView.setCollectionViewLayout(flowLayout2, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.todayWeatherCollectionView.register(TodayWeatherCollectionViewCell.self,
                                     forCellWithReuseIdentifier: TodayWeatherCollectionViewCell.identifier)
        self.todayWeatherCollectionView.delegate = self
        self.todayWeatherCollectionView.dataSource = self
        
        self.tenDaysCollectionView.register(TenDaysWeatherCollectionViewCell.self, forCellWithReuseIdentifier: TenDaysWeatherCollectionViewCell.identifier)
        self.tenDaysCollectionView.delegate = self
        self.tenDaysCollectionView.dataSource = self
    }
    
    private func setStyle() {
        scrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = false
        }
        
        backgroundImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: "background")
        }
        
        bindData(data: selectedItem!)
        
        location.do {
            $0.font = UIFont.regular(size: 36)
        }
        
        temperature.do {
            $0.font = UIFont.thin(size: 102)
        }
        
        weather.do {
            $0.font = UIFont.regular(size: 24)
        }
        
        tempMaxMin.do {
            $0.font = UIFont.medium(size: 20)
        }
        
        // Today Weather
        todayWeatherContainer.do {
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        }
        
        todayWeatherSummary.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다."
            $0.font = UIFont.regular(size: 18)
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
        }
        
        divider.do {
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        }
        
        todayWeatherCollectionView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        // Ten Days Weather
        tenDaysWeatherContainer.do {
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        }
        
        calendarIconImage.do {
            $0.image = UIImage(systemName: "calendar")
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .lightGray
        }
        
        tenDaysTitle.do {
            $0.text = "10일간의 일기예보"
            $0.font = UIFont.medium(size: 15)
            $0.textColor = .lightGray
        }
        
        tenDaysCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = false
        }
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        contentView.addSubviews(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubviews(location, temperature, weather, tempMaxMin, todayWeatherContainer)
        
        location.snp.makeConstraints {
            $0.top.equalToSuperview().inset(78)
            $0.centerX.equalToSuperview()
        }
        
        temperature.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        weather.snp.makeConstraints {
            $0.top.equalTo(temperature.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        tempMaxMin.snp.makeConstraints {
            $0.top.equalTo(weather.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        // MARK: - TodayWeather
        todayWeatherContainer.snp.makeConstraints {
            $0.top.equalTo(tempMaxMin.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(212)
        }
        
        todayWeatherContainer.addSubviews(todayWeatherSummary, divider, todayWeatherCollectionView)
        
        todayWeatherSummary.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(todayWeatherSummary.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        todayWeatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
        
        // MARK: - 10 Days Weather
        contentView.addSubview(tenDaysWeatherContainer)
        
        tenDaysWeatherContainer.snp.makeConstraints {
            $0.top.equalTo(todayWeatherContainer.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(675)
        }
        
        tenDaysWeatherContainer.addSubviews(calendarIconImage, tenDaysTitle, tenDaysCollectionView)
        
        calendarIconImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(24)
        }
        
        tenDaysTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalTo(calendarIconImage.snp.trailing).offset(5)
        }
        
        tenDaysCollectionView.snp.makeConstraints {
            $0.top.equalTo(tenDaysTitle.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func bindData(data: WeatherDataModel) {
        if let korean = CountryName(rawValue: data.name) {
            let koreanCountry = korean.translatedKorean()
            self.location.text = koreanCountry
        }
        self.temperature.text = "\(Int(data.main.temp - 273.15))°"
        self.weather.text = data.weather[0].description
        self.tempMaxMin.text = "최고:\(Int(data.main.tempMax - 273.15))° 최저:\(Int(data.main.tempMin - 273.15))°"
    }
    
    @objc func listButtonTapped() {
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension DetailViewController: UICollectionViewDelegate {}
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == todayWeatherCollectionView {
            return todayWeatherDummyData.count
        } else if collectionView == tenDaysCollectionView {
            return tenDaysWeatherDummyData.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == todayWeatherCollectionView {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TodayWeatherCollectionViewCell.identifier,
                                                                for: indexPath) as? TodayWeatherCollectionViewCell else { return UICollectionViewCell() }
            
            item.todayWeatherbindData(data: todayWeatherDummyData[indexPath.row])
            
            return item
            
        } else if collectionView == tenDaysCollectionView {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TenDaysWeatherCollectionViewCell.identifier,
                                                                for: indexPath) as? TenDaysWeatherCollectionViewCell else { return UICollectionViewCell() }
            
            item.tenDaysWeatherBindData(data: tenDaysWeatherDummyData[indexPath.row])
            
            return item
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if collectionView == tenDaysCollectionView {
            cell.layer.addBorder(to: cell.contentView, at: .top, color: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5), thickness: 0.2)
        }
    }
}
