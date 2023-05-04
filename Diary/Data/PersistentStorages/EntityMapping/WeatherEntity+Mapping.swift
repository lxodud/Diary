//
//  WeatherEntity+Mapping.swift
//  Diary
//
//  Created by 이태영 on 2023/03/24.
//

import Foundation

extension WeatherEntity {
    func toDTO() -> WeatherDTO? {
        guard let main = self.main,
              let icon = self.icon else { return nil }
        return WeatherDTO(main: main, icon: icon)
    }
}
