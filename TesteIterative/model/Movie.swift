//
//  Movie.swift
//  TesteIterative
//
//  Created by Nilson Carraro on 28/06/2018.
//  Copyright © 2018 Nilson Carraro. All rights reserved.
//

import Foundation
import HandyJSON

class Movie: HandyJSON {
    var poster_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    var genre_ids: [NSInteger]?
    var id: NSInteger?
    var original_title: String?
    var original_language: String?
    var title: String?
    var backdrop_path: String?
    var popularity: NSNumber?
    var vote_count: NSInteger?
    var video: Bool?
    var vote_average: Bool?
    
    required init() {}
}
