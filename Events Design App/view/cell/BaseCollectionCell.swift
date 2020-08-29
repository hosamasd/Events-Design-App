//
//  BaseCollectionCell.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI Setup
        setupViews()
    }
    
    func setupViews()  {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
