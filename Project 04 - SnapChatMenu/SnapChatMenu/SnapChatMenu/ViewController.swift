//
//  ViewController.swift
//  SnapChatMenu
//
//  Created by youngjun goo on 28/08/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func setUpCameraView() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        guard let leftView: UIViewController = UINib(nibName: "LeftView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIViewController else {
            return
        }
        let centerView: CamerView =
        
        
    }


}

