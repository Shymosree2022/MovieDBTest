//
//  API.swift
//  TheMovieDBTest
//
//  Created by Shymosree on 4/6/22.
//

import Foundation

struct API {
    private static let baseUrl = "https://api.themoviedb.org/3/%@?api_key=%@"
    static let apiKeySettingKey = "38e61227f85671163c275f9bd95a8803"

    private var apiKey = "38e61227f85671163c275f9bd95a8803"

    func searchMovie(query: String, completion: @escaping ([Result])->()) {
        makeRequest(path: "search/movie", parameter: "query", query:query) { (data) in
            completion(TheDecoder.parseMovieSearchResults(data))
        }
    }
    
    func retrieveConfiguration(query: String, completion: @escaping (Configurations)->()) {
        makeRequest(path: "configuration", parameter: nil, query: nil) { (data) in
            completion(TheDecoder.parseConfiguration(data))
        }
    }
    
    private func makeRequest(path: String,parameter : String?, query : String?, completion: @escaping (Data)->()) {
        
        guard var url = URL(string: String(format: API.baseUrl, path, apiKey)) else {
            print("Invalid URL.")
            return
        }
         
        if query != nil && parameter != nil {
            url = url.appending(parameter!, value: query)
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                print("Invalid response or empty data")
                return
            }
            
            completion(data)
        }
        
        dataTask.resume()
    }
}

extension URL {

    func appending(_ queryItem: String, value: String?) -> URL {

        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        return urlComponents.url!
    }
}
