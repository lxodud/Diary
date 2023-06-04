//
//  DefaultLocationRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/10.
//

final class DefaultLocationRepository {
    private let locationService: LocationService
    
    init(locationService: LocationService = CLLocationService()) {
        self.locationService = locationService
    }
}

extension DefaultLocationRepository: LocationRepository {
    func fetchCurrentLocation() -> Location {
        return locationService.fetchCurrentLocation()
    }
}
