//
//  ViewController.swift
//  PullToRefresh
//
//  Created by youngjun goo on 17/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var index = 0
    let cellIdentifer = "NewCellIdentifier"
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 375, height: 64))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // code로 TableView 생성
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        
        emojiData = favoriteEmoji
        let emojiTableView = tableView
        
        emojiTableView?.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emojiTableView?.dataSource = self
        emojiTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = self.refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        //refreshcontrol에
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), for: .valueChanged)
        
        self.refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.white
        
        self.title = "emoji"
        self.navBar.barStyle = UIBarStyle.blackTranslucent
        
        emojiTableView?.rowHeight = UITableView.automaticDimension
        emojiTableView?.estimatedRowHeight = 60.0
        emojiTableView?.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
        self.view.addSubview(emojiTableView!)
        self.view.addSubview(navBar)
    }
    
    //UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)! as UITableViewCell
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    
    //RoadEmoji
    
    @objc func didRoadEmoji() {
        // DispatchQueue asyncAfter 시간을 설정하여 후에 코드를 실행
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 3 ) {
            self.emojiData = [self.newFavoriteEmoji,self.favoriteEmoji][self.index]
            // refresh 종료
            self.refreshControl.endRefreshing()
            // tableView 새로 고침
            self.tableView.reloadData()
            self.index = (self.index + 1) % 2
        }
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
}

