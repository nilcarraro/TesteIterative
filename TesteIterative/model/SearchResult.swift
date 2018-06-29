//
//  SearchResult.swift
//  TesteIterative
//
//  Created by Nilson Carraro on 28/06/2018.
//  Copyright © 2018 Nilson Carraro. All rights reserved.
//

import Foundation
import HandyJSON

class SearchResult: HandyJSON {
    var page: NSInteger?
    var total_results: NSInteger?
    var total_pages: NSInteger?
    var results: [Movie]?
    
    required init() {}
}
