//
//  MessagesViewCell.swift
//  SimpleAI
//
//  Created by Johnny Perdomo on 10/5/18.
//  Copyright © 2018 Johnny Perdomo. All rights reserved.
//

import UIKit

class MessagesViewCell: UITableViewCell {
    
    var message: MessageModel? {
        didSet {
            guard let unwrappedMessage = message else { return }
            messageTextLbl.text = unwrappedMessage.content
        }
    }

    private let messageTextLbl: UILabel = {
        let messageTextlbl = UILabel()
        messageTextlbl.translatesAutoresizingMaskIntoConstraints = false
        return messageTextlbl
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpLayout()
    }
    

    func setUpLayout() {
        addSubview(messageTextLbl)
        
        messageTextLbl.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        messageTextLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        messageTextLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        messageTextLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder")
    }
}
