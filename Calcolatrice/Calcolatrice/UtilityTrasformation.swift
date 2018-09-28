//
//  UtilityTrasformation.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 25/09/2018.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation

class UtilityTrasformation{
    let maxNOfChar = 10
    
    func toNumber(s: String) -> Double?{
        return Double(s.replacingOccurrences(of: ",", with: "."))
    }
    
    func toString(n: Double) -> String?{
        let nStr = "\(n)".replacingOccurrences(of: ".", with: ",")
        
        let index = nStr.index(after: nStr.firstIndex(of: ",") ?? nStr.endIndex)
        let s = nStr.suffix(from: index)
        let num = Double(s) ?? 0.0
        
        if num == 0{// decimal 0
            
            let sDecimalPart = nStr.prefix(upTo: nStr.firstIndex(of: ",") ?? nStr.endIndex)
            
            return String(sDecimalPart)
            
        }else {// decimal part <> 0
            let decimalMaxLength = maxNOfChar - nStr.prefix(upTo: index).count
            let decimalLength = s.count
            
            var decimalMaxLengthfactor: Double = 1
            var decimalFactor: Double = 1
            
            for _ in 1...decimalLength{
                decimalFactor = decimalFactor * 10
            }
            
            for _ in 1...decimalMaxLength{
                decimalMaxLengthfactor = decimalMaxLengthfactor * 10
            }
            
            var roundedDecimalPart: Double
            
            if decimalLength > decimalMaxLength{ // truncate decimal to decimalMaxLenght
                roundedDecimalPart = round(num/decimalFactor * decimalMaxLengthfactor)/decimalMaxLengthfactor
            }else{
                roundedDecimalPart = num/decimalFactor
            }
            
            let a = " \(roundedDecimalPart)"
            let sDecimalPart: String  = "\(a.suffix(from: a.index(after: a.firstIndex(of: ".") ?? a.endIndex)))"
            
            return "\(nStr.prefix(upTo: nStr.index(before: index)))," + sDecimalPart
        }
    }
}
