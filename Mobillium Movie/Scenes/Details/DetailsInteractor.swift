//
//  DetailsInteractor.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Alamofire
import UIKit

protocol DetailsInteractor: class {
    func retriveDetails(for movie: String, _ completionHandler: @escaping (Result<MovieDetails, Error>) -> Void)
}

class DetailsInteractorImpl: DetailsInteractor {
    private let service: DetailsService

    init(service: DetailsService) {
        self.service = service
    }

    func retriveDetails(for movie: String, _ completionHandler: @escaping (Result<MovieDetails, Error>) -> Void) {
        let url = "\(APIHelper.moviePath)\(movie)?api_key=\(APIHelper.key)&language=en-US"
        print("URL: \(url)")
        AF.request(url).responseData { response in
            switch response.result {
            case let .success(data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601

                do {
                    let details = try decoder.decode(MovieDetails.self, from: data)
                    print(details)
                    completionHandler(.success(details))

                } catch {
                    completionHandler(.failure(error))
                }

            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
