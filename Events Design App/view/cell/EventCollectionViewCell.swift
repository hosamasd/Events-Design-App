//
//  EventCollectionViewCell.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class EventCollectionViewCell: BaseCollectionCell {
    
    
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        v.layer.cornerRadius = 20
        return v
    }()
    
    lazy var  cardImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "img1"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 20
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    override  func setupViews()  {
        
        
        addSubview(cardView)
        cardView.addSubview(cardImage)
        
        cardImage.fillSuperview()
        cardView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    
    
}
