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


    @IBOutlet weak var messagesCollectionView: UICollectionView!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.delegate = self
        messagesCollectionView.dataSource = self
        
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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MessagesViewCell
        
        cell.layer.cornerRadius = 10
        return cell
    }
}
