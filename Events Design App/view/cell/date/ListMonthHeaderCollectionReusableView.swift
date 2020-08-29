//
//  ListMonthHeaderCollectionReusableView.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class ListMonthHeaderCollectionReusableView: UICollectionReusableView {
    
    
    lazy var monthHeaderView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        v.layer.cornerRadius = 30
        v.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        v.constrainWidth(constant: 90)
        v.constrainHeight(constant: 60)
        return v
    }()
    
    lazy var monthLabel = UILabel(text: "", font: .systemFont(ofSize: 17), textColor: .white)
    
    lazy var eventCount = UILabel(text: "", font: .systemFont(ofSize: 17), textColor: .lightGray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews(views: monthHeaderView,eventCount)
        monthHeaderView.addSubview(monthLabel)
        
        monthHeaderView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil)
        eventCount.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 20))
        
        NSLayoutConstraint.activate([
            monthHeaderView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            monthLabel.centerYAnchor.constraint(equalTo: monthHeaderView.centerYAnchor),
            monthLabel.centerXAnchor.constraint(equalTo: monthHeaderView.centerXAnchor),
            
            eventCount.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

