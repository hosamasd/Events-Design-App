//
//  EventListCollectionViewCell.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class EventListCollectionViewCell: BaseCollectionCell {
    
    var data:EventList?{
        didSet{
            manageData()
        }
    }
    
    lazy var dayLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    
    lazy var eventImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.constrainWidth(constant: 100)
        img.constrainHeight(constant: 150)
        return img
    }()
    
    lazy var eventTitle:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 17)
        return l
    }()
    
    lazy var beginningLabel = UILabel(text: "Beginning", font: UIFont.systemFont(ofSize: 16), textColor: .lightGray)
    lazy var beginningTime:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .darkGray
        l.font = UIFont.systemFont(ofSize: 16)
        l.constrainWidth(constant: 80)
        return l
    }()
    
    lazy var endLabel = UILabel(text: "End", font: UIFont.systemFont(ofSize: 16), textColor: .lightGray)
    
    lazy var endTime = UILabel(text: "", font: UIFont.systemFont(ofSize: 16), textColor: .darkGray)
    
    lazy var locationLabel = UILabel(text: "Location", font: UIFont.systemFont(ofSize: 16), textColor: .lightGray)
    
    lazy var locationPlace = UILabel(text: "", font: UIFont.systemFont(ofSize: 16), textColor: .darkGray)
    
    override func setupViews() {
        [endLabel,locationLabel].forEach({$0.constrainWidth(constant: 80)})
        
        addSubViews(views: dayLabel,eventTitle,eventImage,beginningLabel,endLabel,locationLabel,beginningTime,endTime,locationPlace)
        
        dayLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 30, left: 35, bottom: 0, right: 0))
        eventImage.anchor(top: topAnchor, leading: dayLabel.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 15, left: 35, bottom: 0, right: 0))
        eventTitle.anchor(top: topAnchor, leading: eventImage.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 40, left: 20, bottom: 0, right: 0))
        beginningLabel.anchor(top: eventTitle.bottomAnchor, leading: eventImage.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 3, left: 20, bottom: 0, right: 0))
        beginningTime.anchor(top: eventTitle.bottomAnchor, leading: beginningLabel.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 3, left: 20, bottom: 0, right: 0))
        endLabel.anchor(top: beginningLabel.bottomAnchor, leading: eventImage.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 3, left: 20, bottom: 0, right: 0))
        endTime.anchor(top: beginningTime.bottomAnchor, leading: endLabel.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 3, left: 20, bottom: 0, right: 0))
        locationLabel.anchor(top: endLabel.bottomAnchor, leading: eventImage.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 3, left: 20, bottom: 0, right: 0))
        locationPlace.anchor(top: endLabel.bottomAnchor, leading: locationLabel.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 3, left: 20, bottom: 0, right: 0))
        
    }
    
    func setUpDayLabel(_ date:Int, _ day:String){
        let attributedText = NSMutableAttributedString(string:"\(date)\n" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        attributedText.append(NSAttributedString(string: "\(day)" , attributes:
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        dayLabel.attributedText = attributedText
    }
    
    func manageData(){
        guard let data = data else { return }
        setUpDayLabel(data.date, data.day)
        beginningTime.text = data.beginning
        endTime.text = data.end
        locationPlace.text = data.location
        eventImage.image = UIImage(named: data.image)
        eventTitle.text = data.title
    }
}
