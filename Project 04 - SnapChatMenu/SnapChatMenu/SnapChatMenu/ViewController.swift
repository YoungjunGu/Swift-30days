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
        
        setUpCameraView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpCameraView() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        // https://zeddios.tistory.com/297 : xib 사용법
        guard let leftView: UIViewController = UINib(nibName: "LeftView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIViewController else {
            return
        }
        let centerView: CameraView = CameraView(nibName: "CameraView", bundle: nil)
        let rightView: RightView = RightView(nibName: "RightView", bundle: nil)
        
        leftView.view.frame = CGRect(x: 0, y: 0, width: screenWidth-200, height: screenHeight)
        centerView.view.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        rightView.view.frame = CGRect(x: 2*screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        // SCrollView 설정
        self.scrollView.addSubview(leftView.view)
        self.scrollView.addSubview(rightView.view)
        self.scrollView.addSubview(centerView.view)
        self.scrollView.contentSize = CGSize(width: screenWidth * 3, height: screenHeight)
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    

}

