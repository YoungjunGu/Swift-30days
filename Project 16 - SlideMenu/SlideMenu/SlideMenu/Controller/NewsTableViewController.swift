//
//  NewsTableViewController.swift
//  SlideMenu
//
//  Created by youngjun goo on 30/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class NewsTableViewController: BaseTableViewController {
    
    let menuTransitionManager = MenuTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Every Moments"
        self.view.backgroundColor = UIColor(red: 0.062, green: 0.062, blue: 0.07, alpha: 1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let menuTableVC = segue.destination as? MenuTableViewController else { return }
        guard let currentTitle = self.title else { return }
        menuTableVC.currentItem = currentTitle
        menuTableVC.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
    }
    
    
    
}

// MARK: - Table view data sourc
extension NewsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! NewsTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        if indexPath.row == 0 {
            cell.postImageView.image = UIImage(named: "1")
            cell.postTitleLabel.text = "Love mountain."
            cell.postAuthorLabel.text = "Allen Wang"
            cell.authorImageView.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.postImageView.image = UIImage(named: "2")
            cell.postTitleLabel.text = "New graphic design - LIVE FREE"
            cell.postAuthorLabel.text = "Cole"
            cell.authorImageView.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.postImageView.image = UIImage(named: "3")
            cell.postTitleLabel.text = "Summer sand"
            cell.postAuthorLabel.text = "Daniel Hooper"
            cell.authorImageView.image = UIImage(named: "c")
            
        } else {
            cell.postImageView.image = UIImage(named: "4")
            cell.postTitleLabel.text = "Seeking for signal"
            cell.postAuthorLabel.text = "Noby-Wan Kenobi"
            cell.authorImageView.image = UIImage(named: "d")
            
        }
        
        return cell
    }
}

// MARK: MenuTransitionManager delegate
extension NewsTableViewController: MenuTransitionManagerDelegate {
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
