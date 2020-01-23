//
//  HoroscopeAPI.swift
//  Horoscopes
//
//  Created by Christian Hurtado on 1/23/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation
import NetworkHelper

struct HoroscopeAPI {
    
    static func getHoroscope(for horoscope: String,
                             completion: @escaping (Result<Horoscope, AppError>)->()) {
        
        let horoscopeEndpointURL = "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscope)/today"
        
        guard let url = URL(string: horoscopeEndpointURL) else {
            completion(.failure(.badURL(horoscopeEndpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(Horoscope.self, from: data)
                    completion(.success(result))
                } catch {
                    print("Error")
                }
            }
        }
    }
}
