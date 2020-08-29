//
//  ListDateHeaderCollectionReusableView.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class ListDateHeaderCollectionReusableView: UICollectionReusableView {
    
    
    lazy var monthHeaderView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        v.layer.cornerRadius = 30
        v.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        v.constrainHeight(constant: 60)
        return v
    }()
    
    lazy var monthLabel = UILabel(text: "", font: .systemFont(ofSize: 17), textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(monthHeaderView)
        monthHeaderView.addSubview(monthLabel)
        
        monthHeaderView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        NSLayoutConstraint.activate([
            monthHeaderView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            monthLabel.centerYAnchor.constraint(equalTo: monthHeaderView.centerYAnchor),
            monthLabel.centerXAnchor.constraint(equalTo: monthHeaderView.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

