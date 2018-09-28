//
//  NumberTypeStrategy.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 20/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation
import UIKit

class NumberTypeStrategy: ButtonTypeStrategy{
    let nMaxOfChar = 10
    
    func updateView(buttonAC: UIButton!, operation: inout Operation?,
                    resultLabel: UILabel!,
                    operationLabel: UILabel!,
                    memberLabels: [UILabel]!,
                    isCommaSelectedOnMember: inout Bool,
                    isDefaultValue: inout Bool,
                    currentMember: inout Int,
                    buttonTitle: String){
        
        if let r = resultLabel.text, r.count < nMaxOfChar || isDefaultValue {
            
            if isDefaultValue {// no value for currentMember selected
                
                if currentMember == 0{
                    
                    operation = nil
                    memberLabels[0].isHidden = true
                    memberLabels[1].isHidden = true
                    operationLabel.isHidden = true
                    
                }
                
                resultLabel.text = buttonTitle
                
                if buttonTitle != "0"{
                    
                    isDefaultValue = false
                    
                }
                
            }else {
                resultLabel.text = resultLabel.text! + buttonTitle
            }
            
            // updating current member
            memberLabels[currentMember].text = resultLabel.text!
            
        }
        
    }
    
}
