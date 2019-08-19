//
//  ViewController.swift
//  CustomFont
//
//  Created by youngjun goo on 19/08/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.

// MARK : Reference
// Custom Font 적용 법 : https://zeddios.tistory.com/199
// T

import UIKit

class ViewController: UIViewController {
    
    private let cellIdentifier = "FontCell"
    
    var textData = ["iOS 개발자 구영준" , "Be Faithful to the Basic, Be Honest!!", " Studying iOS " , "#스위프트", "#iOS", "애플", "12345678910", "!@#!@%!@^!@%!@$%&*^&%$"]
    
    var fontNames = ["NanumFontSetup_GoECO_TTF_Ver1.0", "NanumFontSetup_Myungjo_TTF Ver3.01", "BlackHanSans-Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var changeFontLabel: UILabel!
    @IBOutlet weak var fontTableView: UITableView!
    

    @objc func changeFontDidTouch(_ sender: AnyObject) {
        // Label을 touch시 발생시킬 콜백 함수
        fontRowIndex = (fontRowIndex + 1) % fontNames.count
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label의 모서리를 둥글게
        changeFontLabel.layer.cornerRadius = 50
        changeFontLabel.layer.masksToBounds = true
        // 이벤트가 queue에서 무시되고 재거되는지 여부를 결정하는 값
        changeFontLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeFontDidTouch(_:)))
        changeFontLabel.addGestureRecognizer(gesture)
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK : Extension TableView Delegate
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell
    }
    
    
}

