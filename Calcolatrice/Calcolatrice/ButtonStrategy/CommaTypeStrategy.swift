//
//  CommaTypeStrategy.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 20/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation
import UIKit

class CommaTypeStrategy: ButtonTypeStrategy{
    func updateView(buttonAC: UIButton!, operation: inout Operation?,
                    resultLabel: UILabel!,
                    operationLabel: UILabel!,
                    memberLabels: [UILabel]!,
                    isCommaSelectedOnMember: inout Bool,
                    isDefaultValue: inout Bool,
                    currentMember: inout Int,
                    buttonTitle: String){
        
        if let r = resultLabel.text, (!r.contains(",") || isDefaultValue) && r.count < 9{
            if isDefaultValue || r == "Error"{
                
                isDefaultValue = false
                resultLabel.text = "0,"
                
                if currentMember == 0{
                    
                    memberLabels[0].isHidden = true
                    memberLabels[1].isHidden = true
                    operationLabel.isHidden = true
                    
                    operation = nil
                    memberLabels[1].text = nil
                    operationLabel.text = nil
                }
                
            }else{
                
                resultLabel.text = resultLabel.text! + ","
                
            }
            memberLabels[currentMember].text = resultLabel.text!
            isCommaSelectedOnMember = true
        }
        
    }
}
