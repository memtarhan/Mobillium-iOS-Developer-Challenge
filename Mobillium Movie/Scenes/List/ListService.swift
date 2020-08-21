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
    func retrieve(forList list: ListType, _ completionHandler: @escaping (Result<[Movie], Error>) -> Void)
}

class ListServiceImpl: ListService {
    func retrieve(forList list: ListType, _ completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(APIHelper.key)&language=en-US&page=1"
        AF.request(url).responseData { response in
            switch response.result {
            case let .success(data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601

                do {
                    let movies = try decoder.decode(Movies.self, from: data)
                    completionHandler(.success(movies.results))

                } catch {
                    completionHandler(.failure(error))
                }

            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
