//
//  Api.swift
//  ConcurrencyDemo
//
//  Created by Ibrahim Mo Gedami on 13/01/2022.
//

import Foundation
extension URLSession{
    func getData(from url : URL) async throws -> (Data , URLResponse){
        return try await withCheckedThrowingContinuation{ continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data , let response = response else {
                    continuation.resume(throwing: AppError.noData)
                    return
                }/Users/ebrahiMoGedamy/Documents/iOS/iOSApps/ConcurrencyDemo/ConcurrencyDemo/Api.swift
                continuation.resume(returning:( data , response))
                return
            }.resume()
        }
    }
}
