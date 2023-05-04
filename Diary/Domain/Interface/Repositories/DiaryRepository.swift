//
//  DiaryReository.swift
//  Diary
//
//  Created by 이태영 on 2023/03/24.
//

import Foundation

protocol DiaryRepository {
    func createDiary(
        with diary: Diary?,
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    )
    
    func fetchDiaryList(
        completion: @escaping (Result<[Diary], CoreDataError>) -> Void
    )
    
    func updateDiary(
        with diary: Diary?,
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    )
    
    func deleteDiary(
        with id: UUID,
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    )
}
