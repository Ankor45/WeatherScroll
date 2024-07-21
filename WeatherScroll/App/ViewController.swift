//
//  ViewController.swift
//  WeatherScroll
//
//  Created by Andrei Kovryzhenko on 21.07.2024.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    let weatherInfo = WeatherInfo.getWeatherInfo()
    let weatherView = WeatherView()
    let weatherScrollCollection: UICollectionView = {
        var layout = Layout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 100, height: 100)
        layout.minimumLineSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return collection
    }()
    //MARK: -  ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        weatherScrollCollection.layoutIfNeeded()
        let startWeather = Int.random(in: 0..<weatherInfo.count)
        let idexPath = IndexPath(item: startWeather, section: 0)
        weatherScrollCollection.scrollToItem(
            at: idexPath,
            at: .centeredHorizontally,
            animated: false
        )
        weatherView.configure(with: weatherInfo[startWeather])
    }
    
    //MARK: - Setup UI
    private func setupViews() {
        setupWeatherView()
        setupWeatherScrollCollection()
    }
    private func setupWeatherView() {
        view.addSubview(weatherView)
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func setupWeatherScrollCollection() {
        weatherView.addSubview(weatherScrollCollection)
        weatherScrollCollection.backgroundColor = .white.withAlphaComponent(0.1)
        weatherScrollCollection.delegate = self
        weatherScrollCollection.dataSource = self
        weatherScrollCollection.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        weatherScrollCollection.backgroundColor = .white.withAlphaComponent(0.1)
        weatherScrollCollection.backgroundView?.layer.masksToBounds = true
        weatherScrollCollection.backgroundView?.layer.cornerRadius = 20
        weatherScrollCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherScrollCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherScrollCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherScrollCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherScrollCollection.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

//MARK: - CollectionView delegate
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherInfo.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WeatherCollectionViewCell
        let infoForCell = weatherInfo[indexPath.row]
        cell.configure(with: infoForCell)
        cell.layer.cornerRadius = 12
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let animator = UIViewPropertyAnimator(duration: 1.2, curve: .easeInOut) {
            self.weatherView.configure(with: self.weatherInfo[indexPath.row])
            self.weatherView.weatherImage.center = CGPoint(x: self.view.center.x , y:  self.view.frame.height + self.weatherView.weatherImage.frame.size.height / 2)
            self.weatherView.textLabel.frame = .init(x: 0, y: 0, width: 0, height: 0)
        }
        animator.addAnimations {
            self.weatherView.weatherImage.transform = .identity.scaledBy(x: 0.3, y: 0.3)
            self.weatherView.weatherImage.transform = .identity.scaledBy(x: 1.0, y: 1.0)
        }
        animator.startAnimation()
    }
}

#Preview{
    ViewController()
}
