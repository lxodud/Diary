//
//  NetworkError.swift
//  Diary
//
//  Created by 이태영 on 2023/01/05.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case transportError
    case translateResponseError
    case serverError(statusCode: Int)
    case parsingError
}
