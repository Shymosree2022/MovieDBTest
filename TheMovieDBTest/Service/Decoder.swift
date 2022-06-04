//
//  Decoder.swift
//  TheMovieDBTest
//
//  Created by Shymosree on 4/6/22.
//

import Foundation

struct TheDecoder {

    static func parseMovieSearchResults(_ data: Data) -> [Result] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let results = try! decoder.decode(Response.self, from: data)
        
        return results.results
    }
    
    static func parseConfiguration(_ data: Data) -> Configurations {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let results = try! decoder.decode(Configurations.self, from: data)
        
        return results
    }


}
