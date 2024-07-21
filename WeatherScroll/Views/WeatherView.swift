//
//  WeatherView.swift
//  WeatherScroll
//
//  Created by Andrei Kovryzhenko on 22.07.2024.
//

import UIKit

class WeatherView: UIView {
    
    let weatherImage = UIImageView()
    let textLabel = UILabel()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with info: WeatherInfo) {
        textLabel.text = info.text.localized()
        weatherImage.image = UIImage(systemName: info.imageName)
    }
    //MARK: - Setup UI
    func setupView() {
        backgroundColor = .black.withAlphaComponent(0.95)
        setupImage()
        setupTextLabe()
    }
    func setupImage() {
        addSubview(weatherImage)
        weatherImage.backgroundColor = .white.withAlphaComponent(0.05)
        weatherImage.layer.cornerRadius = 20
        weatherImage.preferredSymbolConfiguration = .preferringMulticolor()
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImage.widthAnchor.constraint(equalToConstant: 300),
            weatherImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    func setupTextLabe() {
        addSubview(textLabel)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.font = .boldSystemFont(ofSize: 20)
        textLabel.layer.cornerRadius = 10
        textLabel.backgroundColor = .white.withAlphaComponent(0.1)
        textLabel.layer.masksToBounds = true
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

