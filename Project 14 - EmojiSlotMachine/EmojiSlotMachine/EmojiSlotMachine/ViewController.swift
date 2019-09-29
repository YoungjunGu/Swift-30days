//
//  ViewController.swift
//  EmojiSlotMachine
//
//  Created by youngjun goo on 28/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Property
    @IBOutlet weak var emojiPickerView: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var emojiArray = [String]()
    private var bounds: CGRect = CGRect.zero
    private var rand1 = [Int]()
    private var rand2 = [Int]()
    private var rand3 = [Int]()
    private var currectFalg = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bounds = goButton.bounds
        emojiArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 0...100 {
            self.rand1.append((Int)(arc4random() % 10 ))
            self.rand2.append((Int)(arc4random() % 10 ))
            self.rand3.append((Int)(arc4random() % 10 ))
        }
        
        resultLabel.text = ""
        
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        
        // goButton
        goButton.layer.cornerRadius = 6
        goButton.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        goButton.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            self.goButton.alpha = 1
        }, completion: nil)
        
    }
    
    // MARK: IBAction
    @IBAction func goButtonDidTouch(_ sender: UIButton) {
        let index1: Int
        let index2: Int
        let index3: Int
        
        if currectFalg {
            index1 = Int(arc4random() % 90 + 3)
            index2 = rand2.firstIndex(of: rand1[index1])!
            index3 = rand3.lastIndex(of: rand1[index1])!
            
        } else {
            index1 = Int(arc4random() % 90 + 3)
            index2 = Int(arc4random() % 90 + 3)
            index3 = Int(arc4random() % 90 + 3)
            
        }
        
        emojiPickerView.selectRow(index1, inComponent: 0, animated: true)
        emojiPickerView.selectRow(index2, inComponent: 1, animated: true)
        emojiPickerView.selectRow(index3, inComponent: 2, animated: true)
        
        if rand1[emojiPickerView.selectedRow(inComponent: 0)] == rand2[emojiPickerView.selectedRow(inComponent: 1)] && rand2[emojiPickerView.selectedRow(inComponent: 1)] == rand3[emojiPickerView.selectedRow(inComponent: 2)] {
            resultLabel.text = "Bingo"
            
        } else {
            resultLabel.text = "😓"
        }
        
        // goButton의 Animation이 완료가 되자 마자 다시 Animate 함수 호출
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            
            self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
            
        }) { (complete: Bool) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions(), animations: {
                
                self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
                
            }, completion: nil)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: UIPickerViewDataSource
    // 몇개로 구성할 지를 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rand1.count
    }
    
    // MARK: UIPickerViewDelegate
    // 사이즈에 관한
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        // 위에서 설정한 selectedRow의 Component에 따라 컨텐츠르 다르게 보여주는 작업을 한다.
        if component == 0 {
            pickerLabel.text = emojiArray[(Int)(rand1[row])]
        } else if component == 1 {
            pickerLabel.text = emojiArray[(Int)(rand2[row])]
        } else {
            pickerLabel.text = emojiArray[(Int)(rand3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        // 중앙 정렬
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
}

