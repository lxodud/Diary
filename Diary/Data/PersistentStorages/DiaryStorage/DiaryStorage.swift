//
//  DiaryStorage.swift
//  Diary
//
//  Created by 이태영 on 2023/05/04.
//

import Foundation

protocol DiaryStorage {
    func create(
        with diary: Diary?,
        completion: @escaping(Result<Void, Error>) -> Void
    )
    
    func fetch(
        completion: @escaping (Result<[Diary], Error>) -> Void
    )
    
    func update(
        with diary: Diary?,
        completion: @escaping(Result<Void, Error>) -> Void
    )
    
    func delete(
        with id: UUID,
        completion: @escaping(Result<Void, Error>) -> Void
    )
}
