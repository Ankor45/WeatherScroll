//
//  Extension + String.swift
//  WeatherScroll
//
//  Created by Andrei Kovryzhenko on 22.07.2024.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
