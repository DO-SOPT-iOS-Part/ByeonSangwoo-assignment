//
//  WeatherInfoViewController.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 10/27/23.
//

import UIKit

class WeatherInfoViewController: UIViewController {
    
    var verticalScrollView = UIScrollView()
    var verticalContentView = UIView()
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    var location: UILabel = {
        let label = UILabel()
        label.text = "의정부시"
        label.font = .regular(size: 36)
        
        return label
    }()
    
    var temperature: UILabel = {
        let label = UILabel()
        label.text = "21°"
        label.font = .thin(size: 102)
        
        return label
    }()
    
    var weather: UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.font = .regular(size: 24)
        
        return label
    }()
    
    var temperatureMinMax: UILabel = {
        let label = UILabel()
        label.text = "최고:29° 최저:15°"
        label.font = .medium(size: 20)
        
        return label
    }()
    
    var weatherInfoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        
        return view
    }()
    
    var informationLabel: UILabel = {
        var informationLabel = UILabel()
        informationLabel.text = "08:00~09:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다."
        informationLabel.font = .regular(size: 18)
        informationLabel.numberOfLines = 0
        informationLabel.lineBreakMode = .byWordWrapping
        
        return informationLabel
    }()
    
    var divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        
        return divider
    }()
    
    let scrollView = UIScrollView()
    var contentView = UIView()
    
    var timeLineStackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        return stackView
    }()
    
    var bottomDivider: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        
        return divider
    }()
    
    var bottomStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        let topBorder = CALayer()
//        topBorder.borderColor = UIColor(red: 0.165, green: 0.188, blue: 0.251, alpha: 1).cgColor
        topBorder.borderColor = UIColor.red.cgColor
        topBorder.borderWidth = 10
        topBorder.frame = CGRect(x: 0, y: 0, width: stackView.frame.size.width, height: 1)
        
        stackView.layer.addSublayer(topBorder)
        
        return stackView
    }()
    
    var mapButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "map"), for: .normal)
        
        return button
    }()
    
    var sliderStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    var startSlider: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "startSlider")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        return imageView
    }()
    
    var basicSlider: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "basicSlider")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        return imageView
    }()
    
    @objc var goToListButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "listButtonImage"), for: .normal)
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
        goToListButton.addTarget(self, action: #selector(goToListView), for: .touchUpInside)
    }
    
    func setLayout() {
        self.view.addSubview(verticalScrollView)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.isUserInteractionEnabled = true
        
        verticalScrollView.translatesAutoresizingMaskIntoConstraints = false
        verticalContentView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalScrollView.showsVerticalScrollIndicator = false
        verticalScrollView.contentInsetAdjustmentBehavior = .never
        
        verticalScrollView.addSubview(verticalContentView)
        verticalContentView.addSubview(backgroundImage)
        
        [location, temperature, weather, temperatureMinMax, weatherInfoView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            backgroundImage.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            verticalScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            verticalScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            verticalScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            verticalScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            verticalContentView.topAnchor.constraint(equalTo: verticalScrollView.topAnchor),
            verticalContentView.leadingAnchor.constraint(equalTo: verticalScrollView.leadingAnchor),
            verticalContentView.trailingAnchor.constraint(equalTo: verticalScrollView.trailingAnchor),
            verticalContentView.bottomAnchor.constraint(equalTo: verticalScrollView.bottomAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: verticalContentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: verticalContentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: verticalContentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: verticalContentView.bottomAnchor),
            
            location.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 78),
            location.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            
            temperature.topAnchor.constraint(equalTo: location.bottomAnchor),
            temperature.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            
            weather.topAnchor.constraint(equalTo: temperature.bottomAnchor),
            weather.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            
            temperatureMinMax.topAnchor.constraint(equalTo: weather.bottomAnchor),
            temperatureMinMax.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            
            weatherInfoView.topAnchor.constraint(equalTo: temperatureMinMax.bottomAnchor, constant: 54),
            weatherInfoView.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            weatherInfoView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 20),
            weatherInfoView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -20),
            weatherInfoView.heightAnchor.constraint(equalToConstant: 212)
        ])
        
        verticalContentView.widthAnchor.constraint(equalTo: verticalScrollView.widthAnchor).isActive = true
        let contentViewHeight = verticalContentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        scrollView.addSubview(contentView)
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        timeLineStackView.translatesAutoresizingMaskIntoConstraints = false
        
        weatherInfoView.addSubview(scrollView)
        
        [informationLabel, divider].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            weatherInfoView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: weatherInfoView.topAnchor, constant: 10),
            informationLabel.leadingAnchor.constraint(equalTo: weatherInfoView.leadingAnchor, constant: 20),
            informationLabel.trailingAnchor.constraint(equalTo: weatherInfoView.trailingAnchor),
            informationLabel.widthAnchor.constraint(equalToConstant: .screenWidth - 60),
            
            divider.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 11),
            divider.trailingAnchor.constraint(equalTo: weatherInfoView.trailingAnchor),
            divider.widthAnchor.constraint(equalToConstant: .screenWidth - 50),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            scrollView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 14),
            scrollView.leadingAnchor.constraint(equalTo: weatherInfoView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: weatherInfoView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: weatherInfoView.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])
        
        contentView.addSubview(timeLineStackView)
        
        for var i in 0..<24 {
            let weatherInfoview = self.createWeatherTimelineView(time: i)
            weatherInfoview.translatesAutoresizingMaskIntoConstraints = false
            weatherInfoview.widthAnchor.constraint(equalToConstant: 44).isActive = true
            weatherInfoview.heightAnchor.constraint(equalToConstant: 130).isActive = true
            i += 1
            timeLineStackView.addArrangedSubview(weatherInfoview)
        }
        
        NSLayoutConstraint.activate([
            timeLineStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeLineStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeLineStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            timeLineStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            timeLineStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        
        [bottomDivider, bottomStackView, mapButton, sliderStackView, startSlider, basicSlider, goToListButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.view.addSubview(bottomStackView)
        self.view.addSubview(bottomDivider)
        
        bottomStackView.addArrangedSubview(mapButton)
        bottomStackView.addArrangedSubview(sliderStackView)
        bottomStackView.addArrangedSubview(goToListButton)
        
        sliderStackView.addArrangedSubview(startSlider)
        sliderStackView.addArrangedSubview(basicSlider)
        
        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            bottomStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 82),
            
            bottomDivider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomDivider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomDivider.topAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: 10),
            bottomDivider.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    func createWeatherTimelineView(time: Int) -> UIView {
        let timeLineInfoView = UIView()
        
        let timeLabel = UILabel()
        if (time == 0) {
            timeLabel.text = "Now"
        } else {
            timeLabel.text = "\(time)시"
        }
        timeLabel.font = .medium(size: 17)
        
        let weatherIcon = UIImageView()
        weatherIcon.image = UIImage(named: "lightning")
        
        let temp = UILabel()
        temp.text = "21°"
        temp.font = .medium(size: 22)
        
        timeLineInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        [timeLabel, weatherIcon, temp].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            timeLineInfoView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: timeLineInfoView.topAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: timeLineInfoView.centerXAnchor),
            
            weatherIcon.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 14),
            weatherIcon.centerXAnchor.constraint(equalTo: timeLineInfoView.centerXAnchor),
            weatherIcon.widthAnchor.constraint(equalToConstant: 35),
            weatherIcon.heightAnchor.constraint(equalToConstant: 35),
            
            temp.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 14),
            temp.centerXAnchor.constraint(equalTo: timeLineInfoView.centerXAnchor),
        ])
        
        return timeLineInfoView
    }
    
    @objc func goToListView() {
        navigationController?.popViewController(animated: true)
    }
}
