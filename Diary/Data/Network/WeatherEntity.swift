//
//  Weather.swift
//  Diary
//
//  Created by 이태영 on 2023/01/03.
//

struct WeatherDTO: Hashable {
    let main: String
    let icon: String
    
    enum CodingKeys: CodingKey {
        case main, icon, weather
    }
}

extension WeatherDTO: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var nestedContainer = try container.nestedUnkeyedContainer(forKey: .weather)
        
        let valuesContainer = try nestedContainer.nestedContainer(keyedBy: CodingKeys.self)
        self.main = try valuesContainer.decode(String.self, forKey: .main)
        self.icon = try valuesContainer.decode(String.self, forKey: .icon)
    }
}

extension WeatherDTO {
    func toDomain() {
        
    }
}
