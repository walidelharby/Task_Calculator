//
//  CalculatorVC.swift
//  CalcuatorAPP
//
//  Created by walid Elharby on 18/01/2022.
//

import UIKit


class CalculatorVC: UIViewController,UITextFieldDelegate {
    // MARK: - Outlets
    
    @IBOutlet weak var operationCollectionView: UICollectionView!
    @IBOutlet weak var numberTextfield: UITextField!
    @IBOutlet weak var resultLB: UILabel!
    private(set) var cell = "OperationCell"
    
    
    // MARK: - Properties
    let viewModel = CalculateViewModel()
    var currentOperation:Operationval?
    var firstnum:Double = 0.0
    var resultnum:Double = 0.0
    var model:[Operationmodel] = []
    var redu :Int = 0
    private var displayValue: Double {
        get {
            return Double(numberTextfield.text ?? Constants.emptyString) ?? Double.nan
        }
        set {
            let tmp = String(newValue).removeAfterPointIfZero()
            numberTextfield.text = tmp.setMaxLength(of: 8)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextfield.delegate = self
        operationCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func performOperation(_ sender: UIButton) {
       
        if sender.tag == 0{
            currentOperation = .undo
         
            if  self.model.count != 0 && self.redu != self.model.count {
                self.redu = self.redu + 1
                print(self.redu)
                var count = model.count
                var ind = count - self.redu
                print(ind)
                    resultLB.text = "Result = \(model.getElement(at: count - self.redu )?.result ?? 0.0)"
                res = model.getElement(at: count - self.redu )?.result ?? 0.0
                self.firstnum = model.getElement(at: count - self.redu )?.result ?? 0.0
                }
          
        }else if sender.tag == 1{
            if let text = numberTextfield.text , let value = Double(text),firstnum == 0.0{
                firstnum = value
                numberTextfield.text = "0.0"
            }
            currentOperation = .add
            
        }else if sender.tag == 2{
            if let text = numberTextfield.text , let value = Double(text),firstnum == 0.0{
                firstnum = value
                numberTextfield.text = "0.0"
            }
            currentOperation = .sub
            
        }else if sender.tag == 3{
            if let text = numberTextfield.text , let value = Double(text),firstnum == 0.0{
                firstnum = value
                numberTextfield.text = "0.0"
            }
            currentOperation = .mult
            
        }else if sender.tag == 4{
            if let text = numberTextfield.text , let value = Double(text),firstnum == 0.0{
                firstnum = value
                numberTextfield.text = "0.0"
            }
            currentOperation = .div
            
        }else if sender.tag == 5{
            if numberTextfield.text != "0.0"{
            print(numberTextfield.text)
            if let operation = currentOperation {
                var secondnum = 0.0
                if let text = numberTextfield.text , let value = Double(text){
                    secondnum = value
                }
                switch operation {
                case .add:
                    print(firstnum)
                    print(secondnum)
                    let result = firstnum + secondnum
                    let op = Operationmodel(lastresult: firstnum, operaton: .add, number: secondnum, result: result)
                    model.append(op)
                    firstnum = result
                    numberTextfield.text = "0.0"
                    
                    operationCollectionView.reloadData()
                    resultLB.text = "Result = \(result)"
                    res = result

                    break
                case .sub:
                    let result = firstnum - secondnum
                    resultLB.text = "Result = \(result)"
                    res = result

                    let op = Operationmodel(lastresult: firstnum, operaton: .sub, number: secondnum, result: result)
                    model.append(op)
                    firstnum = result
                    numberTextfield.text = "0.0"
                    operationCollectionView.reloadData()

                    break
                case .div:
                    
                    let result = firstnum / secondnum
                    resultLB.text = "Result = \(result)"
                    res = result

                    let op = Operationmodel(lastresult: firstnum, operaton: .div, number: secondnum, result: result)
                    model.append(op)
                    firstnum = result
                    numberTextfield.text = "0.0"
                    operationCollectionView.reloadData()

                    break
                case .mult:
                    let result = firstnum * secondnum
                    resultLB.text = "Result = \(result)"
                    res = result

                    let op = Operationmodel(lastresult: firstnum, operaton: .mult, number: secondnum, result: result)
                    model.append(op)
                    firstnum = result
                    numberTextfield.text = "0.0"
                    operationCollectionView.reloadData()

                    break
                case .redo:
                    
                 
                    break
                case .undo:
                   
                    
                    break
               
                
                }}
            }
        }else if sender.tag == 6{
            currentOperation = .redo
          
            if self.redu != 1 {
                self.redu = self.redu - 1
         print(redu)
                let count = model.count
                
                    resultLB.text = "Result = \(model.getElement(at: count - self.redu)?.result ?? 0.0)"
                res = model.getElement(at: count - self.redu)?.result ?? 0.0

                self.firstnum = model.getElement(at: count - self.redu )?.result ?? 0.0


            }
        }
        self.numberTextfield.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.numberTextfield.text = ""
    }
}


extension CalculatorVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        resultLB.text = "Result = \(model.getElement(at: indexPath.row)?.result ?? 0.0)"
        self.redu = self.model.count - indexPath.row
        print(self.redu)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(model.count)
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! OperationCell
        if model.getElement(at: indexPath.row)?.operaton == .add{
            cell.operationTitleLable.text = "+ \(model.getElement(at: indexPath.row)?.number ?? 0.0)"

        }else if model.getElement(at: indexPath.row)?.operaton == .sub{
            cell.operationTitleLable.text = "- \(model.getElement(at: indexPath.row)?.number ?? 0.0)"

        }
        else if model.getElement(at: indexPath.row)?.operaton == .mult{
            cell.operationTitleLable.text = "x \(model.getElement(at: indexPath.row)?.number ?? 0.0)"

        }
        else if model.getElement(at: indexPath.row)?.operaton == .div{
            cell.operationTitleLable.text = "/ \(model.getElement(at: indexPath.row)?.number ?? 0.0)"

        }
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60.0, height: 60.0)
        
        
    }
    
    
    
    
    
}
