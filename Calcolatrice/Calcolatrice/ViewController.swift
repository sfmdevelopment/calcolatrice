//
//  ViewController.swift
//  Calcolatrice
//
//  Created by Stefano Fiormarino on 04/09/18.
//  Copyright © 2018 Stefano Fiormarino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isCommaSelectedOnMember: Bool = false
    var isOperatorChoosen: Bool = false
    var nOfMembersEntred: Int = 0
    let buttonsStrategy:[Int:ButtonTypeStrategy] = [0:NumberTypeStrategy(),
                                                    1:NumberTypeStrategy(),
                                                    2:NumberTypeStrategy(),
                                                    3:NumberTypeStrategy(),
                                                    4:NumberTypeStrategy(),
                                                    5:NumberTypeStrategy(),
                                                    6:NumberTypeStrategy(),
                                                    7:NumberTypeStrategy(),
                                                    8:NumberTypeStrategy(),
                                                    9:NumberTypeStrategy(),
                                                    10:CommaTypeStrategy(),
                                                    11:EqualTypeStrategy(),
                                                    12:OperationTypeStrategy(),
                                                    13:OperationTypeStrategy(),
                                                    14:OperationTypeStrategy(),
                                                    15:OperationTypeStrategy(),
                                                    16:FastOperationTypeStrategy(),
                                                    17:FastOperationTypeStrategy(),
                                                    18:ACTypeStrategy()]
    var operation: Operation?
    var isDefaultValue: Bool = true
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet var      memberLabels: [UILabel]!
    @IBOutlet weak var buttonAC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        memberLabels[0].text = nil
        memberLabels[1].text = nil
        memberLabels[0].isHidden = true
        memberLabels[1].isHidden = true
        operationLabel.text = ""
        operationLabel.isHidden = true
        resultLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func keyboardButtonPressed(_ sender: UIButton) {
        
        if let x = buttonsStrategy[sender.tag]{
            
            x.updateView(buttonAC: buttonAC, operation: &operation, resultLabel: resultLabel, operationLabel: operationLabel, memberLabels: memberLabels, isCommaSelectedOnMember: &isCommaSelectedOnMember, isDefaultValue: &isDefaultValue, currentMember: &nOfMembersEntred, buttonTitle: sender.titleLabel!.text!)
            
        }else{
            
            print("Errore")
            
        }
    }
}
