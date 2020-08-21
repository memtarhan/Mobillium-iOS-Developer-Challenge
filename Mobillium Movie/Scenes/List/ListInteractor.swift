//
//  ListInteractor.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Alamofire
import UIKit

protocol ListInteractor: class {
    func retrieve(forList list: ListType, page: Int, _ completionHandler: @escaping (Result<[Movie], Error>) -> Void)
}

class ListInteractorImpl: ListInteractor {
    private let service: ListService

    init(service: ListService) {
        self.service = service
    }

    func retrieve(forList list: ListType, page: Int, _ completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        let url = "\(list.apiPrefix)api_key=\(APIHelper.key)&language=en-US&page=\(page)"
        print(url)
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
