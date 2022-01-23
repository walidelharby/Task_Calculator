//
//  CurrencyServicesProtocol.swift
//  CalcuatorAPP
//
//  Created by walid Elharby on 23/01/2022.
//

import Foundation
protocol CurrencyServicesProtocol {

    /// SAMPLE FUNCTION -* Please rename this function to your real function
    ///
    /// - Parameters:
    ///   - success: -- success closure response, add your Model on this closure.
    ///                 example: success(_ data: YourModelName) -> ()
    ///   - failure: -- failure closure response, add your Model on this closure.
    ///                 example: success(_ data: APIError) -> ()
    ///                 _ photos: [Photo]?, _ error: APIError?
    func getCurrenyService(complete: @escaping (_ _currency:CurrencyModel, _ error: APIError?)->())
}
enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
    case notFound = "Page Not Found"
}
