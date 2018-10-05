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

    
    let messagesTableView: UITableView = {
        let messagesTableView = UITableView()
        messagesTableView.register(MessagesViewCell.self, forCellReuseIdentifier: "cellId")
        messagesTableView.translatesAutoresizingMaskIntoConstraints = false
        messagesTableView.isUserInteractionEnabled = false
        return messagesTableView
    }()
    
    let messagesArray = [
        MessageModel(content: "Hey What's Up", id: "user"),
        MessageModel(content: "Nothing Much how about you sir?", id: "agent")
    ]
    
    
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTableView.dataSource = self
        messagesTableView.delegate = self
        messagesTableView.separatorStyle = .none
        messagesTableView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        view.addSubview(messagesTableView)
        
        messagesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        messagesTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        messagesTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        messagesTableView.bottomAnchor.constraint(equalTo: messageField.topAnchor, constant: -20).isActive = true
        
        

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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MessagesViewCell
        
        let message = messagesArray[indexPath.row]
        cell.message = message
        cell.backgroundColor = .clear
        cell.layer.cornerRadius = 10
        return cell
    }
    

}
