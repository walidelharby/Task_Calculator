//
//  ConverterVC.swift
//  CalcuatorAPP
//
//  Created by walid Elharby on 18/01/2022.
//

import UIKit
class ConverterVC: UIViewController {
  
    

    @IBOutlet weak var resultLB: UILabel!
    @IBOutlet weak var ammountTF: UITextField!
    var viewModel = ConverterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        viewModel.getCurrency()
        self.ammountTF.text = "\(res)"
        // Do any additional setup after loading the view.
    }
    
    // MARK: - setupViewModel_Funcs
    fileprivate func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
            } else {
                 print("DATA READY")
            }
        }

        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
            // show UI Internet is disconnected
        }

        self.viewModel.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }
      
        self.viewModel.didGetData = {
            print(self.viewModel.model?.conversionRates?["EGP"])
            
        }

    }
    @IBAction func didPressConvert(_ sender: Any) {
        
        self.resultLB.text = "\((Double(self.ammountTF.text ?? "1.0") ?? 1.0)*(self.viewModel.model?.conversionRates?["EGP"] ?? 1.0) )"

    }
    
}
