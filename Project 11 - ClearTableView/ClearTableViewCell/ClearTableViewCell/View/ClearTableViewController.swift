//
//  ClearTableViewController.swift
//  ClearTableViewCell
//
//  Created by youngjun goo on 25/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit
import Foundation

class ClearTableViewController: UITableViewController {
    
    
    var tableData: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCell()
        
        tableView.delegate = self
        tableView.dataSource = self

        self.view.backgroundColor = UIColor.black
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(ClearTableViewCell.self, forCellReuseIdentifier: "clearCell")

    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "clearCell", for: indexPath) as! ClearTableViewCell
        
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(index: indexPath.row)
    }

}


extension ClearTableViewController {
    
    func colorForIndex(index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }
    
    
    func createCell() {
        for i in 0...20 {
            tableData.append(String(i))
        }
    }

}
