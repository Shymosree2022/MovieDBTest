//
//  Result.swift
//  TheMovieDBTest
//
//  Created by Shymosree on 4/6/22.
//

import Foundation

struct Result: Codable {
    var originalTitle = "";
    var overview = "";
    var posterPath = "";

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
    }
}
