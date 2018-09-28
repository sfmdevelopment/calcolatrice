//
//  EqualTypeStrategy.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 20/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation
import UIKit


class EqualTypeStrategy: ButtonTypeStrategy{
    
    func updateView(buttonAC: UIButton!, operation: inout Operation?,
                    resultLabel: UILabel!,
                    operationLabel: UILabel!,
                    memberLabels: [UILabel]!,
                    isCommaSelectedOnMember: inout Bool,
                    isDefaultValue: inout Bool,
                    currentMember: inout Int,
                    buttonTitle: String){
        
        guard resultLabel.text == "Error" else {
            
            if let res =  resultLabel.text{
                
                if let c = res.last, c == ","{
                    memberLabels[currentMember].text = UtilityTrasformation().toString(n: UtilityTrasformation().toNumber(s: res + "0")!)
                }else{
                    memberLabels[currentMember].text = UtilityTrasformation().toString(n: UtilityTrasformation().toNumber(s: res)!)
                }
                
            }
            
            if let sm1 = memberLabels[0].text,
               let sm2 = memberLabels[1].text,
               let m1 = Double(sm1.replacingOccurrences(of: ",", with: ".")),
               let m2 = Double(sm2.replacingOccurrences(of: ",", with: ".")){
                
                memberLabels[currentMember].isHidden = false
                
                if  let op = operation, let result = op.calculate(member1: m1, member2: m2){
                    
                    resultLabel.text  = UtilityTrasformation().toString(n: result)
                    
                }else{
                    
                    resultLabel.text = "Error"
                    
                }
                
                currentMember = 0
                isDefaultValue = true
                isCommaSelectedOnMember = false
            }
            return
        }
    }
    
}
