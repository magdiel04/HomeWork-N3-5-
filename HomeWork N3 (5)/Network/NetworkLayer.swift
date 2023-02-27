//
//  NetworkLayer.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 11/2/23.
//

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=a")!
    
    func fetchData() async throws -> Coctail {
            let (data,_) = try await URLSession.shared.data(from: baseURL)
            return try await decodeData(data: data)
        }
        
        private func decodeData<T: Decodable>(data: Data) async throws -> T {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }
}
