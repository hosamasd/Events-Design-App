//
//  ListView.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

struct ListData {
    let month:String!
    let events:Int!
    let listData:[EventList]!
}

struct EventList {
    let date:Int!
    let day:String!
    let image:String!
    let title:String!
    let beginning:String!
    let end:String!
    let location:String!
}

class ListView: UIView {

    var listData:[ListData] = [
        ListData(month: "SEP", events: 2, listData: [
            EventList(date: 7, day: "Sun", image: "img1", title: "Air Legend", beginning: "9:00 AM", end: "6:00 PM", location: "Melun"),
            EventList(date: 9, day: "Tue", image: "img2", title: "Meeting Auto", beginning: "1:00 PM", end: "6:00 AM", location: "Saint Cloud")
        ]),
        ListData(month: "OCT", events: 1, listData: [
            EventList(date: 31, day: "Fri", image: "img3", title: "Halloween Party", beginning: "8:00 PM", end: "6:00 AM", location: "La Rochette")
        ]),
    ]
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(EventListCollectionViewCell.self, forCellWithReuseIdentifier: "EventListCollectionViewCell")
        cv.register(ListMonthHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ListMonthHeaderCollectionReusableView")
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ListView:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return listData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listData[section].listData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventListCollectionViewCell", for: indexPath) as! EventListCollectionViewCell
        cell.data = listData[indexPath.section].listData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ListMonthHeaderCollectionReusableView", for: indexPath) as! ListMonthHeaderCollectionReusableView
                header.backgroundColor = .white
                if listData[indexPath.section].events > 1 {
                    header.eventCount.text = "\(listData[indexPath.section].events ?? 0) Events"
                } else {
                    header.eventCount.text = "\(listData[indexPath.section].events ?? 0) Event"
                }
                header.monthLabel.text = listData[indexPath.section].month
                return header
            default:
                return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 70)
    }
    
}
