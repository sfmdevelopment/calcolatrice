//
//  ACTypeStrategy.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 20/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation
import UIKit

class ACTypeStrategy: ButtonTypeStrategy{
    func updateView(buttonAC: UIButton!, operation: inout Operation?, resultLabel: UILabel!, operationLabel: UILabel!, memberLabels: [UILabel]!, isCommaSelectedOnMember: inout Bool, isDefaultValue: inout Bool, currentMember: inout Int, buttonTitle: String) {
        
        
        if currentMember == 1 && !isDefaultValue{// undo step
            resultLabel.text = "0"
            isDefaultValue = true
            memberLabels[1].text = nil
            memberLabels[1].isHidden = true
            
        }else{// reset
            
            currentMember = 0
            
            isDefaultValue = true
            
            isCommaSelectedOnMember = false
            
            memberLabels[0].isHidden = true
            memberLabels[1].isHidden = true
            operationLabel.isHidden = true
            
            resultLabel.text = "0"
            memberLabels[0].text = nil
            memberLabels[1].text = nil
            operationLabel.text = nil
            
        }
        
    }
    
}
