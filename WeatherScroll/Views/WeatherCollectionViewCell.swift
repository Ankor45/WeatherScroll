//
//  WeatherCollectionViewCell.swift
//  WeatherScroll
//
//  Created by Andrei Kovryzhenko on 22.07.2024.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    private let weatherImageView = UIImageView()
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with info: WeatherInfo) {
        textLabel.text = info.text.localized()
        weatherImageView.image = UIImage(systemName: info.imageName)
    }
    //MARK: - Setup UI
    func setupCell() {
        setupTopView()
        setupBottomLabel()
    }
    func setupTopView() {
        contentView.addSubview(weatherImageView)
        weatherImageView.backgroundColor = .black.withAlphaComponent(0.5)
        weatherImageView.layer.cornerRadius = 18
        weatherImageView.preferredSymbolConfiguration = .preferringMulticolor()
        weatherImageView.contentMode = .scaleAspectFit
    
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            weatherImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
            weatherImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.width * 0.7)
        ])
    }
    func setupBottomLabel() {
        contentView.addSubview(textLabel)
        textLabel.layer.cornerRadius = 10
        textLabel.layer.masksToBounds = true
        textLabel.backgroundColor = .black.withAlphaComponent(0.5)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 4),
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
      ])
    }
}
