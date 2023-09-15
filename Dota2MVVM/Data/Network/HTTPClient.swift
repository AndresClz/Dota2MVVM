//
//  HTTPClient.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 14/09/2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    // Agrega otros métodos según sea necesario
}

enum HTTPClientError: Error {
    case invalidURL
    case noInternetConnection
    case networkError(Error)
    case invalidResponse
}

struct HTTPResponse<T> {
    let data: T?
    let response: HTTPURLResponse?
    let error: Error?
}

class HTTPClient {
    // Singleton instance
    static private(set) var shared = HTTPClient()

    private init() {
        // Private initializer to prevent external instantiation
    }

    func request<T: Decodable>(
        _ url: URL,
        method: HTTPMethod,
        responseType: T.Type,
        completion: @escaping (Result<T, HTTPClientError>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            let httpResponse = response as? HTTPURLResponse
            let httpResponseCode = httpResponse?.statusCode
            let httpResponseError = error

            if let error = error {
                // Verificar si el error es debido a la falta de conexión a Internet
                let nsError = error as NSError
                if nsError.domain == NSURLErrorDomain && nsError.code == NSURLErrorNotConnectedToInternet {
                    completion(.failure(.noInternetConnection))
                } else {
                    completion(.failure(.networkError(error)))
                }
                
                // Usar httpResponseError más adelante si es necesario
                print("Error general: \(httpResponseError?.localizedDescription ?? "No description")")
                return
            }

            if httpResponseCode == 200, let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.networkError(error)))
                }
            } else {
                completion(.failure(.invalidResponse))
            }
        }
        task.resume()
    }
}
