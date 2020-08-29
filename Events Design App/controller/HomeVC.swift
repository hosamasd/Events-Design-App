//
//  ViewController.swift
//  Events Design App
//
//  Created by Hossam on 8/29/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit


struct eventScroll {
    let row:Int!
    let section:Int!
}

enum State {
    case column
    case list
}


class HomeVC: UIViewController {
    
    var currState:State!
    lazy var toggleButton = UIButton(type: .system)
    
    var event:[eventScroll] = [
        eventScroll(row: 6, section: 0),
        eventScroll(row: 8, section: 0),
        eventScroll(row: 11, section: 1)
    ]
    
    let eventPoster = ["img1" , "img2", "img3"]
    
    lazy var listView: ListView = {
        let v = ListView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    lazy var calendarView:CalendarView = {
        let v = CalendarView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.homeViewController = self
        v.constrainHeight(constant: 80)
        return v
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "EventCollectionViewCell")
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        seyupViews()
        setUpCustomNavBar()
    }
    
    func seyupViews()  {
        
        view.backgroundColor = .white
        view.addSubViews(views: calendarView,collectionView,listView)
        listView.fillSuperview()
        
        calendarView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        collectionView.anchor(top: calendarView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        
        
        currState = .column
        listView.isHidden = true

//        collectionView.isHidden = true
    }
    
    func setUpCustomNavBar(){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.black
        
        let titleLabel = UILabel(text: "Upcoming Events", font: .systemFont(ofSize: 23))
        titleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        
        toggleButton.setImage(UIImage(named: "list"), for: .normal)
        toggleButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: toggleButton)
        toggleButton.addTarget(self, action: #selector(toggleButtonPressed), for: .touchUpInside)
        
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = toggleButton
        navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
    }
    
    @objc func toggleButtonPressed(){
        if currState == .column {
            self.toggleButton.setImage(UIImage(named: "column"), for: .normal)
            self.listView.isHidden = false
            currState = .list
        } else if currState == .list {
            self.toggleButton.setImage(UIImage(named: "list"), for: .normal)
            self.listView.isHidden = true
            currState = .column
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = Int(targetContentOffset.pointee.x / collectionView.frame.width)
        let index = IndexPath(row: event[x].row, section: event[x].section)
        calendarView.collectionView.selectItem(at: index, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
}


extension HomeVC:UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventPoster.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath) as! EventCollectionViewCell
        //        cell.cardImage.image = UIImage(named: eventPoster[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
