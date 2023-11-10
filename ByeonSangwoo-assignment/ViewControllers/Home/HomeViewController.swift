//
//  HomeViewController.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 10/26/23.
//

import UIKit
import Then
import SnapKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let searchTextField = UITextField()
    private let weatherInfoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setNavigation()
        setStyle()
        setCollectionViewConfig()
        setCollectionViewLayout()
        setLayout()
    }
    
    @objc func goToNextView() {
        let VC = DetailViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func rightButtonTapped() {
        
    }
    
    func setDelegate() {
        searchTextField.delegate = self
    }
    
    func setNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "날씨"
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        let rightButtonItem = UIBarButtonItem(title: "더보기", image: UIImage(systemName: "ellipsis.circle"), target: self, action: #selector(rightButtonTapped))
        self.navigationItem.rightBarButtonItem = rightButtonItem
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 117)
        flowLayout.minimumLineSpacing = 15
        self.weatherInfoCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.weatherInfoCollectionView.register(WeatherInfoCollectionViewCell.self,
                                     forCellWithReuseIdentifier: WeatherInfoCollectionViewCell.identifier)
        self.weatherInfoCollectionView.delegate = self
        self.weatherInfoCollectionView.dataSource = self
    }
    
    func setStyle() {
        searchTextField.do {
            $0.placeholder = "도시 또는 공항 검색"
            
            $0.backgroundColor = .darkGrayColor
            $0.borderStyle = .none
            $0.layer.cornerRadius = 10
            
            $0.autocorrectionType = .no
            $0.spellCheckingType = .no
            $0.autocapitalizationType = .none
            $0.clearButtonMode = .always
            $0.clearsOnBeginEditing = false
            
            $0.addLeftImage(image: UIImage(systemName: "magnifyingglass")!)
        }
    }

    func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        contentView.addSubviews(searchTextField, weatherInfoCollectionView)
        
        searchTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(8)
            $0.height.equalTo(40)
        }
        
        weatherInfoCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherInfoCollectionViewCell.identifier,
                                                            for: indexPath) as? WeatherInfoCollectionViewCell else { return UICollectionViewCell() }
        item.bindData(data: dummyData[indexPath.row])
        item.backgroundView = UIImageView(image: UIImage(named: dummyData[indexPath.row].weatherImage))
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = dummyData[indexPath.item]

        let detailViewController = DetailViewController()
        detailViewController.selectedItem = selectedItem

        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
