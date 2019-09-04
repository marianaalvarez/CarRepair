//
//  ViewController.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/2/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let api = CarRepairAPI()
        api.getCarRepairList { result in
            print(result)
        }
    }


}

