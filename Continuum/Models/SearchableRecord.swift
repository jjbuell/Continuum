//
//  SearchableRecord.swift
//  Continuum
//
//  Created by JJB on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation


protocol SearchableRecord {
    func matchesSearchTerm(searchTerm: String) -> Bool
}
