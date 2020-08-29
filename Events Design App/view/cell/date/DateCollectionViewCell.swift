//
//  DateCollectionViewCell.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class DateCollectionViewCell: BaseCollectionCell {
    
    override var isSelected: Bool {
        didSet{
            cardView.backgroundColor = isSelected ? UIColor(white: 0, alpha: 0.03) : .clear
        }
    }
    
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 4
        return v
    }()
    
    lazy var dateLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "6"
        l.font = UIFont(name: "Avenir-Medium", size: 19)
        return l
    }()
    
    lazy var dayLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Sun"
        l.textColor = UIColor(white: 0, alpha: 0.4)
        l.font = UIFont(name: "Avenir-Medium", size: 16)
        return l
    }()
    
    lazy var presentLabel:UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 2.5
        v.constrainWidth(constant: 5)
        v.constrainHeight(constant: 5)
        return v
    }()
    
    override func setupViews() {
        
        
        addSubview(cardView)
        cardView.addSubViews(views: dateLabel,dayLabel,presentLabel)
        
        cardView.fillSuperview(padding: .init(top: 5, left: 5, bottom: 5, right: 2))
        dateLabel.anchor(top: cardView.topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 13, left: 0, bottom: 0, right: 0))
        dayLabel.anchor(top: dateLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 13, left: 0, bottom: 0, right: 0))
        presentLabel.anchor(top: cardView.bottomAnchor, leading: nil, bottom: nil, trailing: cardView.trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 18))
        
        NSLayoutConstraint.activate([
            
            dateLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            dayLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor)
        ])
    }
    
    
    
    
    
    
    
}
