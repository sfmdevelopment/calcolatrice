//
//  ButtonTypeStrategy.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 11/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import UIKit


protocol ButtonTypeStrategy{
    func updateView(buttonAC: UIButton!,
                    operation: inout Operation?,
                          resultLabel: UILabel!,
                          operationLabel: UILabel!,
                          memberLabels: [UILabel]!,
                          isCommaSelectedOnMember: inout Bool,
                          isDefaultValue: inout Bool,
                          currentMember: inout Int,
                          buttonTitle: String)
}
