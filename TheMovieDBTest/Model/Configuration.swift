//
//  Configuration.swift
//  TheMovieDBTest
//
//  Created by Shymosree on 4/6/22.
//

import Foundation

struct Configurations: Codable {
    let images: Images
    let changeKeys: [String]

    enum CodingKeys: String, CodingKey {
        case images
        case changeKeys = "change_keys"
    }
}
