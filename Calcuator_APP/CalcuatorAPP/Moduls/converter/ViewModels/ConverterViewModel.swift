//
//  ConverterViewModel.swift
//  CalcuatorAPP
//
//  Created by walid Elharby on 23/01/2022.
//

import Foundation
import SVProgressHUD
class ConverterViewModel {
    // MARK: - Properties

    private let service: CurrencyServicesProtocol

     var model: CurrencyModel?
    var islastpage:Bool = false
    /// Count your data in model

    //MARK: -- Network checking

    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.alertMessage = "No network connection. Please connect to the internet"
            self.internetConnectionStatus?()
        }
    }

    //MARK: -- UI Status

    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    /// Define selected model

    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?

    init(withRecipes serviceProtocol: CurrencyServicesProtocol = CurrencyServices() ) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()

    }

    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }

    //MARK: -- Example Func
    func getCurrency() {
        switch networkStatus {
        case .offline:
            
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            // call your service here
            self.isLoading = true

            self.service.getCurrenyService(complete: { data, error in
            
                guard error == nil else {
                    return
                }
                    self.isLoading = false
                self.model = data
                self.didGetData?()

                

                    }
               )
        default:
            break
        }
    }

}

extension ConverterViewModel {
    // MARK: - currency Func
    

}
 
