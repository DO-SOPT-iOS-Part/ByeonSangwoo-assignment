//
//  HomeViewController.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 10/26/23.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var moreButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "moreButtonImage"), for: .normal)
        
        return button
    }()
    
    private var homeTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "날씨"
        label.font = .bold(size: 36)
        
        return label
    }()
    
    private var searchIconView: UIImageView = {
        var icon = UIImageView(image: UIImage(systemName: "search"))
        
        return icon
    }()
    
    private var searchTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "도시 또는 공항 검색"
        
        textField.backgroundColor = .darkGrayColor
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.autocapitalizationType = .none
        textField.clearButtonMode = .always
        textField.clearsOnBeginEditing = false
        
        textField.addLeftImage(image: UIImage(named: "searchBar")!)
        
        return textField
    }()
    
    private var myLocationWeatherInfoView: UIButton = {
        var button = UIButton()
        button.setBackgroundImage(UIImage(named: "cellBackground"), for: .normal)
        button.layer.cornerRadius = 16
        
        let myLocation = UILabel()
        myLocation.text = "나의 위치"
        myLocation.font = .bold(size: 24)
        
        let location = UILabel()
        location.text = "의정부시"
        location.font = .medium(size: 17)
        
        let temperature = UILabel()
        temperature.text = "21°"
        temperature.font = .light(size: 52)
        
        let weather = UILabel()
        weather.text = "흐림"
        weather.font = .medium(size: 16)
        
        let temperatureMaxMin = UILabel()
        temperatureMaxMin.text = "최고:29° 최저:15°"
        temperatureMaxMin.font = .medium(size: 15)
        
        [myLocation, location, temperature, weather, temperatureMaxMin].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            button.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            myLocation.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
            myLocation.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 16),
            
            location.topAnchor.constraint(equalTo: myLocation.bottomAnchor, constant: 2),
            location.leadingAnchor.constraint(equalTo: myLocation.leadingAnchor),
            
            temperature.topAnchor.constraint(equalTo: button.topAnchor, constant: 4),
            temperature.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -16),
            
            weather.leadingAnchor.constraint(equalTo: myLocation.leadingAnchor),
            weather.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10),
            
            temperatureMaxMin.trailingAnchor.constraint(equalTo: temperature.trailingAnchor),
            temperatureMaxMin.bottomAnchor.constraint(equalTo: weather.bottomAnchor)
        ])
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setLayout()
        
        myLocationWeatherInfoView.addTarget(self, action: #selector(goToNextView), for: .touchUpInside)
    }
    
    @objc func goToNextView() {
        let VC = WeatherInfoViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    func setDelegate() {
        searchTextField.delegate = self
    }

    func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        [moreButton, homeTitleLabel, searchTextField, searchIconView, myLocationWeatherInfoView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            moreButton.widthAnchor.constraint(equalToConstant: 50),
            
            homeTitleLabel.topAnchor.constraint(equalTo: moreButton.bottomAnchor),
            homeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            searchTextField.topAnchor.constraint(equalTo: homeTitleLabel.bottomAnchor, constant: 8),
            searchTextField.leadingAnchor.constraint(equalTo: homeTitleLabel.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            myLocationWeatherInfoView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15),
            myLocationWeatherInfoView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            myLocationWeatherInfoView.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor),
        ])
    }
}
