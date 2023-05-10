//
//  CLLocationCoordinate2D+Mapping.swift
//  Diary
//
//  Created by 이태영 on 2023/05/10.
//

import CoreLocation

extension CLLocationCoordinate2D {
    func toDomain() -> Location {
        return Location(
            latitude: self.latitude.description,
            longititude: self.longitude.description
        )
    }
}
