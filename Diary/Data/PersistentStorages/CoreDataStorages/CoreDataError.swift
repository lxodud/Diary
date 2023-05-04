//
//  CoreDataError.swift
//  Diary
//
//  Created by 이태영 on 2023/05/04.
//

import Foundation

enum CoreDataError: Error {
    case fetchError
    case updateError
    case saveError
    case deleteError
    case createError
}
