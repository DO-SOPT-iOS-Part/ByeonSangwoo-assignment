//
//  TotalDetailViewController.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/17/23.
//

import UIKit

class TotalDetailViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var dataArray: [WeatherDataModel] = []
    var currentIndex: Int = 0
    
    private var pageVC: UIPageViewController!
    
    var pageControl = UIPageControl()
    
    private let bottomView = UIView()
    private let bottomStackView = UIStackView()
    private let mapButton = UIButton()
    private let listButton = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        
        addChild(pageVC)
        view.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)
        
        setStyle()
        setLayout()
        configurePageControl()
    }
    
    private func setStyle() {
        bottomView.do {
            $0.backgroundColor = UIColor(red: 0.165, green: 0.188, blue: 0.251, alpha: 1)
        }
        
        bottomStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .top
        }
        
        mapButton.do {
            $0.setImage(UIImage(systemName: "map"), for: .normal)
            $0.tintColor = .white
        }
        
        pageControl.do {
            $0.backgroundColor = .red
        }
        
        listButton.do {
            $0.setImage(UIImage(systemName: "list.bullet"), for: .normal)
            $0.tintColor = .white
            $0.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        self.view.addSubview(bottomView)
        
        if let firstViewController = viewControllerAtIndex(currentIndex) {
            pageVC.setViewControllers([firstViewController], direction: .forward, animated: true)
        }
        
        bottomView.addSubview(bottomStackView)
        
        bottomView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(82)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(bottomView)
        }
        
        bottomStackView.addArrangedSubviews(mapButton, listButton)
        
        mapButton.snp.makeConstraints {
            $0.height.equalTo(44)
        }
        
        pageControl.snp.makeConstraints {
            $0.width.equalTo(300)
        }
        
        listButton.snp.makeConstraints {
            $0.height.equalTo(44)
        }
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 80, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = dataArray.count
        pageControl.currentPage = currentIndex
        pageControl.tintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
    }
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        guard index >= 0 && index < dataArray.count else { return nil }

        let detailVC = DetailViewController()
        detailVC.selectedItem = dataArray[index]
        detailVC.index = index
        currentIndex = index
        
        return detailVC
    }
    
    @objc func listButtonTapped() {
        print("listButtonTapped")
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = (viewController as? DetailViewController)?.index, currentIndex > 0 else { return nil }
        
        return viewControllerAtIndex(currentIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = (viewController as? DetailViewController)?.index, currentIndex < dataArray.count - 1 else { return nil }
        
        return viewControllerAtIndex(currentIndex + 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first as? DetailViewController {
                currentIndex = currentViewController.index
                pageControl.currentPage = currentIndex
            }
        }
    }
}
