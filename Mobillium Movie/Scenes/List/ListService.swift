//
//  ListService.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Alamofire
import UIKit

protocol ListService: class {
    func retrieve()
}

class ListServiceImpl: ListService {
    func retrieve() {
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(APIHelper.key)&language=en-US&page=1"
        AF.request(url).responseData { response in
            switch response.result {
            case let .success(data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601

                do {
                    let movies = try decoder.decode(Movies.self, from: data)
                    movies.results.forEach { (movie) in
                        print("\(APIHelper.imagePath)\(movie.posterPath)")
                    }
                } catch {
                    print("Failed to decode JSON")
                }

            case let .failure(error):
                print(error)
            }
        }
    }
}
