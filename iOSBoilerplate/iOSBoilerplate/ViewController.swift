//
//  ViewController.swift
//  iOSBoilerplate
//
//  Created by Eric on 23/12/22.
//

import UIKit
import AtomicSDK

class ViewController: UIViewController, AACRuntimeVariableDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapDefaultContainer(_ sender: Any) {
        let config = AACConfiguration()
        config.runtimeVariableDelegate = self
        let container = AACStreamContainerViewController(identifier: AtomicSettings.streamContainerId, configuration: config)
        present(container, animated: true)
    }
    
    func cardSessionDidRequestRuntimeVariables(_ cardsToResolve: [AACCardInstance], completionHandler: @escaping AACSessionRuntimeVariablesHandler) {
        for card in cardsToResolve {
            // Resolve variables on all cards.
            card.resolveRuntimeVariable(withName: "numberOfItems", value: "120")
        }        
        completionHandler(cardsToResolve)
    }
}

