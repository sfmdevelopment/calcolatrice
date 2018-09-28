//
//  OperationTypeStrategy.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 20/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation
import UIKit

class OperationTypeStrategy: ButtonTypeStrategy{
    
    func updateView(buttonAC: UIButton!, operation: inout Operation?,
                    resultLabel: UILabel!,
                    operationLabel: UILabel!,
                    memberLabels: [UILabel]!,
                    isCommaSelectedOnMember: inout Bool,
                    isDefaultValue: inout Bool,
                    currentMember: inout Int,
                    buttonTitle: String){
        
        guard resultLabel.text == "Error" else {
            
            operationLabel.text = buttonTitle
            
            if currentMember == 0 {
                
                // set first member and operator
                if let res = resultLabel.text, let n = UtilityTrasformation().toNumber(s: res), let s = UtilityTrasformation().toString(n: n){
                    memberLabels[currentMember].text = s
                    resultLabel.text = s
                }
                
                // show member 1 label and operator label
                operationLabel.isHidden = false
                memberLabels[0].isHidden = false
                
                memberLabels[1].text = nil
                memberLabels[1].isHidden = true
                
                // update of status variables
                currentMember = 1
                isCommaSelectedOnMember = false
                isDefaultValue = true
                
                buttonAC.setTitle( "C", for: buttonAC.state)
                
            }else if currentMember == 1 && !isDefaultValue{
                
                let eqStrategy = EqualTypeStrategy()
                
                eqStrategy.updateView(buttonAC: buttonAC, operation: &operation, resultLabel: resultLabel, operationLabel: operationLabel, memberLabels: memberLabels, isCommaSelectedOnMember: &isCommaSelectedOnMember, isDefaultValue: &isDefaultValue, currentMember: &currentMember, buttonTitle: buttonTitle)
                
                if let res = resultLabel.text, let n = UtilityTrasformation().toNumber(s: res), let s = UtilityTrasformation().toString(n: n){
                    memberLabels[0].text = s
                    resultLabel.text = s
                    
                    memberLabels[1].text = nil
                    memberLabels[1].isHidden = true
                    operationLabel.text = buttonTitle
                    currentMember = 1
                    isDefaultValue = true
                }
                
            }
            
            switch buttonTitle{
            case "+":
                operation = Sum()
            case "-":
                operation = Subtract()
            case "x":
                operation = Multiply()
            case "÷":
                operation = Divide()
            default:break
            }
            
            return
        }
    }
}
