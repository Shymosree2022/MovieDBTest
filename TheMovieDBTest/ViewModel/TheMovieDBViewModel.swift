//
//  TheMovieDBViewModel.swift
//  TheMovieDBTest
//
//  Created by Shymosree on 4/6/22.
//

import UIKit

class TheMovieDBViewModel: NSObject {
    var movieListBinding:(([Result]?, Bool) -> Void)?
    
    var movieList: [Result] = [Result]()
    var configurationUrl : String?
    var configurationPosterSize : String?
    let api = API()

    
    func fetchData (param : String) {
        api.searchMovie(query: param, completion: { result in
            print("Done🔨\(result)")
            self.movieList = result
            if let movieListBinding = self.movieListBinding {
                movieListBinding(self.movieList, true)
                    }
        })
    }
    
    func fetchConfigData() {
        api.retrieveConfiguration(query: "", completion: { result in
            self.configurationUrl = result.images.baseURL
            if result.images.posterSizes.count > 0 {
                self.configurationPosterSize = result.images.posterSizes[0]
            }
        })
        
    }
}
