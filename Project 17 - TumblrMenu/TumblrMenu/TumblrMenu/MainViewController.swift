//
//  MainViewController.swift
//  TumblrMenu
//
//  Created by youngjun goo on 2019/10/03.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToMainViewController(_sender: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
