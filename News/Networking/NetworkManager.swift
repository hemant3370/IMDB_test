//
//  NetworkManager.swift
//  IMDB
//
//  Created by Hemant Singh on 28/05/22.
//

import Foundation

internal enum NetworkError: Error {
    case malformedURL
    case empty
    case parseError(String)
    case apiError(String)
}

internal final class NetworkManager {
    internal static let shared = NetworkManager()
    private static let apiKey = "38a73d59546aa378980a88b645f487fc"
    
    private init() { }
    
    func getArticles(completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        guard let requestURL = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(Self.apiKey)&language=en-US&page=1") else {
            completion(.failure(.malformedURL))
            return
        }
        let request = URLRequest(url: requestURL)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, error == nil {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Response.self, from: data)
                    if let articles = response.results, !articles.isEmpty {
                        return completion(.success(articles.map({
                            Movie(title: $0.title ?? "",
                                  description: $0.overview ?? "",
                                  urlToImage: URL(string: "https://image.tmdb.org/t/p/w500/\($0.posterPath ?? "")"),
                                  releaseDate: $0.releaseDate ?? "",
                                  rating: $0.rating ?? 0,
                                  popularity: $0.popularity ?? 0
                            )})))
                    } else {
                        return completion(.failure(.empty))
                    }
                } catch {
                    return completion(.failure(.parseError(error.localizedDescription)))
                }
            } else if let error = error {
                completion(.failure(.apiError(error.localizedDescription)))
            }
        }
        task.resume()
    }
}
