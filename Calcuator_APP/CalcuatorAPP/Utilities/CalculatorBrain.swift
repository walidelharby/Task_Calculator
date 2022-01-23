//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by walid Elharby on 21/01/2022.
//

import Foundation
struct Operationmodel{
    let lastresult:Double
    let operaton:Operationval
    let number:Double
    let result:Double

}
enum Operationval {
    case add,sub,div,mult,redo,undo
}
var res :Double = 1.0
