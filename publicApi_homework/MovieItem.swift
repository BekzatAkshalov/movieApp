//
//  MovieItem.swift
//  publicApi_homework
//
//  Created by Bekzat on 7/12/24.
//

import Foundation
import SwiftyJSON

struct MovieItem {
    var title = ""
    var rating: Double = 0.0
    var posterPath = ""
    var releaseDate = ""
    var overview = ""
    var popular: Double = 0.0
    
  
    
    init(json: JSON) {
        if let item = json["title"].string {
            title = item
        }
        if let item = json["vote_average"].double {
            rating = item
        }
        if let item = json["poster_path"].string {
            posterPath = item
        }
        if let item = json["release_date"].string {
            releaseDate = item
        }
        if let item = json["overview"].string {
            overview = item
        }
        if let item = json["popularity"].double {
            popular = item
        }
            
      
        
    }
}
    

