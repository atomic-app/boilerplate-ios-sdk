//
//  ViewController.swift
//  iOSBoilerplate
//
//  Created by Eric on 23/12/22.
//

import UIKit
import AtomicSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapDefaultContainer(_ sender: Any) {
        let config = AACConfiguration()
        let container = AACStreamContainerViewController(identifier: AtomicSettings.streamContainerId, configuration: config)
        present(container, animated: true)
    }
}

