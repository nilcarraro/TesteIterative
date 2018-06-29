//
//  MovieService.swift
//  TesteIterative
//
//  Created by Nilson Carraro on 28/06/2018.
//  Copyright © 2018 Nilson Carraro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieService {
    func searchMovie(name: String, _ callBack: @escaping (SearchResult?) -> Void) {
        Alamofire.request("\(Constants.URL_SEARCH_MOVIE)\(name)").responseJSON { response in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            let json = JSON(response.result.value)
            if (SearchResult.deserialize(from: json.rawString(), designatedPath: "") == nil) {
                DispatchQueue.main.asyncAfter(deadline: delayTime) {
                    let zerado = SearchResult()
                    zerado.results = [Movie]()
                    zerado.total_results = 0
                    callBack(zerado)
                }
                return
            }
            
            let res: SearchResult = SearchResult.deserialize(from: json.rawString(), designatedPath: "") as! SearchResult
            
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                callBack(res)
            }
        }
    }
    
    func getDatailMovie(idMovie: NSNumber,  _ callBack: @escaping (MovieDetail?) -> Void) {
        let url = String(format: Constants.URL_DETAIL_MOVIE, idMovie)
        Alamofire.request(url).responseJSON { response in
            let json = JSON(response.result.value)
            let res: MovieDetail = MovieDetail.deserialize(from: json.rawString(), designatedPath: "") as! MovieDetail
            
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                callBack(res)
            }
        }
    }
}
