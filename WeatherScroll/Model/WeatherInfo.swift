//
//  WeatherInfo.swift
//  WeatherScroll
//
//  Created by Andrei Kovryzhenko on 22.07.2024.
//

import UIKit

struct WeatherInfo {

    var imageName: String
    var text: String
    
   static func getWeatherInfo() -> [WeatherInfo] {
        return [
            WeatherInfo(imageName: "sun.max.fill", text: "Солнечно"),
            WeatherInfo(imageName: "cloud.sun.fill", text: "Облачно"),
            WeatherInfo(imageName: "cloud.rain.fill", text: "Дождь"),
            WeatherInfo(imageName: "cloud.bolt.rain.fill", text: "Гроза"),
            WeatherInfo(imageName: "cloud.snow.fill", text: "Снег"),
            WeatherInfo(imageName: "smoke.fill", text: "Пасмурно"),
            WeatherInfo(imageName: "cloud.fog.fill", text: "Туманно")
        ]
    }
}


