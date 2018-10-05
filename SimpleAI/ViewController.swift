//
//  ViewController.swift
//  SimpleAI
//
//  Created by Johnny Perdomo on 10/2/18.
//  Copyright © 2018 Johnny Perdomo. All rights reserved.
//

import UIKit
import AI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AI.sharedService.textRequest("You're dumb").success { (response) in
            if let speech = response.result.fulfillment?.speech {
                print(speech)
                print(response)
            }
            }.failure { (error) in
                print(error)
        }

    }


}

