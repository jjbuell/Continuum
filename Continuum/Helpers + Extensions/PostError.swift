//
//  PostError.swift
//  Continuum
//
//  Created by JJB on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation

enum PostError: LocalizedError {
    case thrown(Error)
    case invalidURL
    case noData
    case badData
    
    var errorDescription: String? {
        switch self {
        
        case .thrown(let error):
            return error.localizedDescription
        case .invalidURL:
            return "Unable to reach server"
        case .noData:
            return "Server responded with no data"
        case .badData:
            return "Server responded with bad data"
        }
    }
} //End of enum
