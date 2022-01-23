//
//  APIRouter.swift
//  Vodafone Task

//  Created by Walid Elharby on 1/8/21.
//
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    

    //MARK: - - Home
    case getCurreny
   
    static let baseURLString = "https://v6.exchangerate-api.com/v6/1f47a194c3a4612131103d0a/latest/USD"
    
    var method: HTTPMethod {
        switch self {
        // MARK: - - Fetch Auth HTTP Method
        case .getCurreny:
            return .get
        default:
            return .post
        }
    }
    
    var path: String {
        switch self {
        // MARK: - - Fetch Auth Path
        case .getCurreny:
            return ""
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var params = Parameters()
        
        let url = try APIRouter.baseURLString.asURL()
        // let encoder = JSONEncoder()
        // dummy values
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        
        
        switch self {
       
    
        case .getCurreny:
           
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        
        print("Param ---\(params)")
        
        return urlRequest
    }
}

