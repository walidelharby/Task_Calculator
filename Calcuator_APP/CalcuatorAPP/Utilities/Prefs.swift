//
//  Prefs.swift
//  Kewi
//
//  Created by Diaa SAlAm on 10/26/19.
//  Copyright © 2019 Diaa SAlAm. All rights reserved.
//

import UIKit

typealias UD = UserDefaults

var prefs: UserDefaults {
    return UserDefaults.standard
}



extension UserDefaults {
    
    enum PrefKeys {
        static let appLangKey = "appLangKey"
        static let apiToken = "apiToken"
        static let firebaseToken = "apiToken"

        static let lang = "lang"
        static let authModel = "authModel"
        static let AuthModelSocial = "AuthModelSocial"
        static let userEmail = "email"
        static let notificationid = "notificationid"

        static let userMobile = "mobile"
        static let userToken = "userToken"
        static let complete = "complete"

        static let subModel = "subModel"
        static let carSaveModel = "carModel"
        static let notificationstatus = "notificationstatus"
        static let questionstatus = "questionstatus"
        static let verified = "verified"
        static let deviceToken = "deviceToken"

        //MARK : Order Steps
        static let userlatitud = "userlatitud"
        static let userLongitude = "userLongitude"
        static let addressName = "addressName"
        static let carId = "carId"
        static let carName = "carName"
        static let serviceName = "serviceName"
        static let servicePrice = "servicePrice"
        static let serviceId  = "serviceId"
        static let dateTime = "dateTime"
        static let notes = "notes"
        static let totalPrice = "totalPrice"
        static let FuserName = "fuserName"
        static let muserName = "muserName"
        static let luserName = "luserName"

        static let userPhoto = "userPhoto"
        static let userNameFB = "userNameFB"
        static let userEmailFB = "userEmailFB"
        static let userFBId = "userFBId"
        static let userNameGoogle = "userNameGoogle"
        static let  userEmailGoogle = "userEmailGoogle"
        static let  userGoogelId = "userGoogelId"
        static let carBrandN = "carBrandN"
        static let carBrandId = "carBrandId"
        static let carModelN = "carModelN"
        static let carModelId = "carModelId"
        static let carYearN = "carYearN"
        static let carYearId = "carYearId"
        static let carMileageN = "carMileageN"
        static let isSocial = "isSocial"
    }
    
    func set<T>(encodable object: T?, forKey key: String) where T: Encodable {
        guard let object = object else {
            prefs.set(nil, forKey: key)
            return
        }
        if let encoded = try? JSONEncoder().encode(object) {
            prefs.set(encoded, forKey: key)
        }
    }
    
    func decodable<T>(forKey key: String, of type: T.Type) -> T? where T: Decodable {
        guard let jsonData = prefs.data(forKey: key),
            let object = try? JSONDecoder().decode(type, from: jsonData) else {
                return nil
        }
        return object
    }
}
extension UserDefaults: ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
}
protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}
