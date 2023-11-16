//
//  WeatherViewModel.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/14/23.
//

import Foundation

class WeatherViewModel {
    static let shared = WeatherViewModel()
    private init() {}
    
    func getWeatherAPI(country: String) async throws -> WeatherDataModel? {
        guard let url = URL(string: baseURL + "q=\(country)&appid=" + APIKEY) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.responseError }
        
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(WeatherDataModel.self, from: data)
            print(result)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
