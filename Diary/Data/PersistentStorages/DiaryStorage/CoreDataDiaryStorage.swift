//
//  CoreDataDiaryStorage.swift
//  Diary
//
//  Created by 이태영 on 2023/05/04.
//

import Foundation

final class CoreDataDiaryStorage {
    private let coreDataStorage: CoreDataStorage
    
    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }
}

// MARK: DiaryStorage
extension CoreDataDiaryStorage: DiaryStorage {
    func create(
        with diary: Diary?,
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    ) {
        coreDataStorage.performBackgroundTask { context in
            guard let diary = diary,
                  let weather = diary.condition
            else {
                completion(.failure(.createError))
                return
            }
            let diaryEntity = DiaryEntity(context: context)
            
            diaryEntity.title = diary.title
            diaryEntity.body = diary.body
            diaryEntity.createdIntervalValue = Int64(diary.createdDate.timeIntervalSince1970)
            diaryEntity.id = diary.id
            
            let weatherEntity = WeatherEntity(context: context)
            weatherEntity.main = weather.main
            weatherEntity.icon = weather.icon
            
            diaryEntity.condition = weatherEntity
            self.coreDataStorage.save()
            completion(.success(()))
        }
    }
    
    func fetch(completion: @escaping (Result<[Diary], CoreDataError>) -> Void) {
        coreDataStorage.performBackgroundTask { context in
            let fetchRequest = DiaryEntity.fetchRequest()
            let dateSort = NSSortDescriptor(key: "createdIntervalValue", ascending: false)
            fetchRequest.sortDescriptors = [dateSort]
            
            guard let entities = try? context.fetch(fetchRequest) else {
                completion(.failure(.fetchError))
                return
            }
            
            completion(.success(entities.compactMap { $0.toDomain() }))
        }
    }
    
    func update(
        with diary: Diary?,
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    ) {
        coreDataStorage.performBackgroundTask { context in
            guard let diary = diary else {
                completion(.failure(.updateError))
                return
            }
            
            let fetchRequest = DiaryEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %@", diary.id.uuidString)
            
            guard let updateObjects = try? context.fetch(fetchRequest),
                  let object = updateObjects.first
            else {
                completion(.failure(.updateError))
                return
            }
            
            object.title = diary.title
            object.body = diary.body
            object.createdIntervalValue = Int64(diary.createdDate.timeIntervalSince1970)
            object.id = diary.id
            self.coreDataStorage.save()
            completion(.success(()))
        }
    }
    
    func delete(
        with id: UUID,
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    ) {
        coreDataStorage.performBackgroundTask { context in
            let fetchRequest = DiaryEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %@", id.uuidString)
            
            guard let objects = try? context.fetch(fetchRequest) else {
                completion(.failure(.deleteError))
                return
            }
            
            objects.forEach {
                context.delete($0)
            }
            
            self.coreDataStorage.save()
            completion(.success(()))
        }
    }
}
