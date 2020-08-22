//
//  SearchInteractor.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Alamofire
import UIKit

protocol SearchInteractor: class {
    func retrieve(forKeyword keyword: String, _ completionHandler: @escaping (Result<[Movie], Error>) -> Void)
}

class SearchInteractorImpl: SearchInteractor {
    func retrieve(forKeyword keyword: String, _ completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        let url = "\(APIHelper.searchPath)api_key=\(APIHelper.key)&query=\(keyword)"
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
