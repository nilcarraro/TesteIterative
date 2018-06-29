//
//  MovieDetail.swift
//  TesteIterative
//
//  Created by Nilson Carraro on 28/06/2018.
//  Copyright © 2018 Nilson Carraro. All rights reserved.
//

import Foundation
import HandyJSON

class MovieDetail: HandyJSON {
    required init() {}
    
    var backdrop_path: String?
    var budget: NSInteger?
    var genres: [Genre]?
    var homepage: String?
    var id: NSInteger?
    var imdb_id: String?
    var original_title: String?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var overview: String?
    var popularity: NSInteger?
    var production_companies: [Any]?
    var production_countries: [Any]?
    var revenue: NSInteger?
    var runtime: NSInteger?
    var spoken_languages: [Any]?
    var status: String?
    var tagline: String?
    var video: Bool?
    var vote_average: NSNumber?
    var vote_count: NSInteger?
    var adult: Bool?
    var belongs_to_collection: NSObject?
    var original_language: String?
}
