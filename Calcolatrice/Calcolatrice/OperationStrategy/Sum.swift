//
//  Sum.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 20/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import Foundation
class Sum: Operation{
    func calculate(member1: Double, member2: Double) -> Double?{
        return round((member1+member2)*10000)/10000
    }
}
