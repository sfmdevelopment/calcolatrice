//
//  Divide.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 20/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation
class Divide: Operation{
    func calculate(member1: Double, member2: Double) -> Double?{
        if member2 == 0 {
            return nil
        }else{
            return round((member1/member2)*10000)/10000
        }
    }
}
