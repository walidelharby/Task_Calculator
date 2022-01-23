//
//  CurrencyServices.swift
//  CalcuatorAPP
//
//  Created by walid Elharby on 23/01/2022.
//
import Foundation
import  Alamofire

class CurrencyServices: CurrencyServicesProtocol {
    func getCurrenyService(complete: @escaping (CurrencyModel, APIError?) -> ()) {
        AF.request(APIRouter.getCurreny)
            .responseJSON(completionHandler: { (resp) in
                print("Get recipes \(resp)")
            })
            .responseDecodable {  (response: DataResponse<CurrencyModel, AFError>) in
                switch response.result {
                    
                case .success(let data):
                    complete(data, nil)


                case .failure(let err):
                    print("error")
                    print("Get My Answer Failure")
                }
        }
    }

}
