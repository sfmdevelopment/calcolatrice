//
//  FastOperationTypeStrategy.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 22/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation
import UIKit

class FastOperationTypeStrategy: ButtonTypeStrategy{
    
    func updateView(buttonAC: UIButton!,
                    operation: inout Operation?,
                    resultLabel: UILabel!,
                    operationLabel: UILabel!,
                    memberLabels: [UILabel]!,
                    isCommaSelectedOnMember: inout Bool,
                    isDefaultValue: inout Bool,
                    currentMember: inout Int,
                    buttonTitle: String){
        
        switch buttonTitle {
            case "+/-":
                let x = ChangeSign()
                if let s1 = resultLabel.text, let m1: Double = UtilityTrasformation().toNumber(s: s1), let result:Double = x.calculate(member1: m1, member2:1.0){
                    
                    resultLabel.text = UtilityTrasformation().toString(n: result)
                    memberLabels[currentMember].text = resultLabel.text!
                    isDefaultValue = false
                }else{
                    resultLabel.text = "Error"
                    isDefaultValue = true
                    currentMember = 0
                    isCommaSelectedOnMember = false
                }
            case "%":
                let x = Percentual()
            
                    // calculate perc
                if let m1: Double = UtilityTrasformation().toNumber(s: memberLabels[0].text ?? resultLabel.text ?? "0"), let m2:Double = UtilityTrasformation().toNumber(s: memberLabels[1].text ?? "1"), let result = x.calculate(member1: m1, member2: m2 ){
                    //setting result and current member label
                    resultLabel.text = UtilityTrasformation().toString(n: result)
                    
                    isDefaultValue = true
            
                    memberLabels[currentMember].isHidden = true
                    memberLabels[currentMember].text = nil
            
                }else{
                    resultLabel.text = "Error"
                    isDefaultValue = true
                    currentMember = 0
                    isCommaSelectedOnMember = false
                }
            default: break
        }
        
    }
}
