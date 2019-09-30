//
//  ViewController.swift
//  SlideMenu
//
//  Created by youngjun goo on 30/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
    }


}

