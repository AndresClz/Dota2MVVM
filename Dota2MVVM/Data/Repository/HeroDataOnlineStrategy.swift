//
//  HeroRepository.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 15/09/2023.
//

import Foundation

class HeroDataOnlineStrategy: HeroDataStrategy {
    // La URL base de la API de OpenDota
    private let baseURL = URL(string: "https://api.opendota.com/api")!

    // El cliente HTTP que se utilizará para realizar las solicitudes
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func fetchHeroes(completion: @escaping (Result<[HeroDTO], HTTPClientError>) -> Void) {
        // Construir la URL completa para la solicitud
        let url = baseURL.appendingPathComponent("heroStats")

        // Realizar la solicitud GET utilizando el httpClient
        httpClient.request(url, method: .get, responseType: [HeroDTO].self) { result in
            // Pasar el resultado al completarion del repositorio
            completion(result)
        }
    }
}
