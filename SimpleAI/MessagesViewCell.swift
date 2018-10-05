//
//  MessagesViewCell.swift
//  SimpleAI
//
//  Created by Johnny Perdomo on 10/5/18.
//  Copyright © 2018 Johnny Perdomo. All rights reserved.
//

import UIKit

class MessagesViewCell: UITableViewCell {
    
    var leftConstraint: NSLayoutConstraint!
    var rightConstraint: NSLayoutConstraint!
    
    var message: MessageModel? {
        didSet {
            guard let unwrappedMessage = message else { return }
            messageTextLbl.text = unwrappedMessage.content
            
            if unwrappedMessage.id == "user" {
                leftConstraint.isActive = false
                rightConstraint.isActive = true
                bubbleBackgroundView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                messageTextLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            } else {
                rightConstraint.isActive = false
                leftConstraint.isActive = true
                bubbleBackgroundView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                messageTextLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            
        }
    }

    private let messageTextLbl: UILabel = {
        let messageTextlbl = UILabel()
        messageTextlbl.translatesAutoresizingMaskIntoConstraints = false
        messageTextlbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return messageTextlbl
        
    }()
    
    private let bubbleBackgroundView: UIView = {
        let bubbleBackgroundView = UIView()
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.layer.cornerRadius = 10
        bubbleBackgroundView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return bubbleBackgroundView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpLayout()
    }
    

    func setUpLayout() {
        addSubview(bubbleBackgroundView)
        addSubview(messageTextLbl)
        
        
        messageTextLbl.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        messageTextLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        messageTextLbl.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        leftConstraint = messageTextLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 32)
        leftConstraint.isActive = false
        
        rightConstraint = messageTextLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -32)
        rightConstraint.isActive = true
        
        bubbleBackgroundView.topAnchor.constraint(equalTo: messageTextLbl.topAnchor, constant: -16).isActive = true
        bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageTextLbl.leadingAnchor, constant: -16).isActive = true
        bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageTextLbl.bottomAnchor, constant: 16).isActive = true
        bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageTextLbl.trailingAnchor, constant: 16).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder")
    }
}
