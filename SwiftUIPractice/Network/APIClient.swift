//
//  APIClient.swift
//  SwiftUIPractice
//
//  Created by Usama Jamil on 3/29/25.
//

import Foundation
import Combine

class APIClient {
    static let shared = APIClient()
    private init() {}

    func fetch<T: Decodable>(from url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingFailed
        }
    }
}

// API Error Handling
enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided is invalid."
        case .invalidResponse:
            return "Received an invalid response from the server."
        case .decodingFailed:
            return "Failed to decode the response."
        }
    }
}
