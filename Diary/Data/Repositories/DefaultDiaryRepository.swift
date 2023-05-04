//
//  DefaultDiaryRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/03/29.
//

import Foundation

final class DefaultDiaryRepository: DiaryRepository {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func fetchDiary(completion: @escaping (Result<Diary, Error>) -> Void) {
        
    }
}
