//
//  DiaryEntity+Mapping.swift
//  Diary
//
//  Created by 이태영 on 2023/03/24.
//

import Foundation

extension DiaryEntity {    
    func toDomain() -> Diary? {
        let createdInt = Int(self.createdIntervalValue)
        let timeInterval = TimeInterval(createdInt)
        
        guard let title = self.title,
              let body = self.body,
              let id = self.id else {
            return nil
        }
        
        return Diary(
            id: id,
            title: title,
            body: body,
            timeInterval: timeInterval,
            condition: self.condition?.weather?.toDomain()
        )
    }
}
