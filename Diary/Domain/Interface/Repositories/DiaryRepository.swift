//
//  DiaryReository.swift
//  Diary
//
//  Created by 이태영 on 2023/03/24.
//

import Foundation

protocol DiaryRepository {
    func fetchDiary(completion: @escaping (Result<Diary, Error>) -> Void)
}
