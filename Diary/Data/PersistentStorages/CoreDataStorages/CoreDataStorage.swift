//
//  CoreDataStorage.swift
//  Diary
//
//  Created by 이태영 on 2023/05/04.
//

import Foundation
import CoreData

final class CoreDataStorage {
    static let shared = CoreDataStorage()
    
//    private lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "Diary")
//        container.loadPersistentStores { _, error in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        }
//
//        return container
//    }()
    
    func save() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        if context.hasChanges {
            try? context.save()
        }
    }
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        CoreDataManager.shared.persistentContainer.performBackgroundTask(block)
    }
}
