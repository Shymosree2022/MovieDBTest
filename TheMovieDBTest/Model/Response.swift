//
//  Response.swift
//  TheMovieDBTest
//
//  Created by Shymosree on 4/6/22.
//

import Foundation

struct Response: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
