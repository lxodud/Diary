//
//  DefaultDiaryRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/03/29.
//

import Foundation

final class DefaultDiaryRepository {
    private let diaryStorage: DiaryStorage
    
    init(diaryStorage: DiaryStorage) {
        self.diaryStorage = diaryStorage
    }
}

extension DefaultDiaryRepository: DiaryRepository {
    func createDiary(with diary: Diary?, completion: @escaping (Result<Void, CoreDataError>) -> Void) {
        diaryStorage.create(with: diary, completion: completion)
    }
    
    func fetchDiaryList(completion: @escaping (Result<[Diary], CoreDataError>) -> Void) {
        diaryStorage.fetch(completion: completion)
    }
    
    func updateDiary(with diary: Diary?, completion: @escaping (Result<Void, CoreDataError>) -> Void) {
        diaryStorage.update(with: diary, completion: completion)
    }
    
    func deleteDiary(with id: UUID, completion: @escaping (Result<Void, CoreDataError>) -> Void) {
        diaryStorage.delete(with: id, completion: completion)
    }
}
