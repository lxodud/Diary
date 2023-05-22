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
        completion: @escaping(Result<Void, Error>) -> Void
    )
    
    func fetchDiaryList(
        completion: @escaping (Result<[Diary], Error>) -> Void
    )
    
    func updateDiary(
        with diary: Diary?,
        completion: @escaping(Result<Void, Error>) -> Void
    )
    
    func deleteDiary(
        with id: UUID,
        completion: @escaping(Result<Void, Error>) -> Void
    )
}
