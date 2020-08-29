//
//  CalendarView.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

struct CalendarYear {
    let month:String
    let date:[CalendarMonth]
}

struct CalendarMonth {
    let date:String!
    let week:String!
    let active:Bool!
}

class CalendarView: UIView {

    var calendarData = [CalendarYear]()
   lazy var homeViewController = HomeVC()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.sectionHeadersPinToVisibleBounds = true
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(DateCollectionViewCell.self, forCellWithReuseIdentifier: "DateCollectionViewCell")
        cv.register(ListDateHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ListDateHeaderCollectionReusableView")
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.fillSuperview()
        
        calendarData = [
            CalendarYear(month: "SEP", date: [
                CalendarMonth(date: "1", week: "Mon", active: false),
                CalendarMonth(date: "2", week: "Tue", active: false),
                CalendarMonth(date: "3", week: "Wed", active: false),
                CalendarMonth(date: "4", week: "Thu", active: false),
                CalendarMonth(date: "5", week: "Fri", active: false),
                CalendarMonth(date: "6", week: "Sat", active: false),
                CalendarMonth(date: "7", week: "Sun", active: true),
                CalendarMonth(date: "8", week: "Mon", active: false),
                CalendarMonth(date: "9", week: "Tue", active: true),
                CalendarMonth(date: "10", week: "Wed", active: false),
                CalendarMonth(date: "11", week: "Thu", active: false),
                CalendarMonth(date: "12", week: "Fri", active: false),
                CalendarMonth(date: "13", week: "Sat", active: true),
                CalendarMonth(date: "14", week: "Sun", active: false),
                CalendarMonth(date: "15", week: "Mon", active: true),
                CalendarMonth(date: "16", week: "Tue", active: false),
            ]),
            CalendarYear(month: "OCT", date: [
                CalendarMonth(date: "20", week: "Mon", active: false),
                CalendarMonth(date: "21", week: "Tue", active: false),
                CalendarMonth(date: "22", week: "Wed", active: false),
                CalendarMonth(date: "23", week: "Thu", active: false),
                CalendarMonth(date: "24", week: "Fri", active: false),
                CalendarMonth(date: "25", week: "Sat", active: false),
                CalendarMonth(date: "26", week: "Sun", active: false),
                CalendarMonth(date: "27", week: "Mon", active: false),
                CalendarMonth(date: "28", week: "Tue", active: false),
                CalendarMonth(date: "29", week: "Wed", active: false),
                CalendarMonth(date: "30", week: "Thu", active: false),
                CalendarMonth(date: "31", week: "Fri", active: true),
            ]),
            CalendarYear(month: "Nov", date: [
                CalendarMonth(date: "1", week: "Sat", active: false),
                CalendarMonth(date: "2", week: "Sun", active: false),
                CalendarMonth(date: "3", week: "Mon", active: false),
                CalendarMonth(date: "4", week: "Tue", active: false),
                CalendarMonth(date: "5", week: "Wed", active: false),
                CalendarMonth(date: "6", week: "Thu", active: false),
                CalendarMonth(date: "7", week: "Fri", active: false),
            ])
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CalendarView:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return calendarData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ListDateHeaderCollectionReusableView", for: indexPath) as! ListDateHeaderCollectionReusableView
                header.monthLabel.text = calendarData[indexPath.section].month
                return header
            default:
                return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarData[section].date.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as! DateCollectionViewCell
        let result = calendarData[indexPath.section].date[indexPath.row]
        cell.dateLabel.text = result.date
        cell.dayLabel.text = result.week
        cell.presentLabel.isHidden = !result.active
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


