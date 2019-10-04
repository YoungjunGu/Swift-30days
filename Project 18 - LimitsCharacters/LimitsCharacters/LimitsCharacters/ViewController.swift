//
//  ViewController.swift
//  LimitsCharacters
//
//  Created by youngjun goo on 2019/10/04.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.delegate = self
            textView.backgroundColor = UIColor.clear
        }
    }
    @IBOutlet weak var bottomUIView: UIView!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.width / 2
        }
    }
    @IBOutlet weak var characterCountLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // observer 등록
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyBoardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyBoardWillHide(_:)), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyBoardWillShow(_ note: NSNotification) {
        let userInfo = note.userInfo
        let keyBoardBounds = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyBoardBounds.size.height
        let animations = {
            self.bottomUIView.transform = CGAffineTransform(translationX: 0, y: -deltaY)
        }
        
        if duration > 0 {
            UIView.animate(withDuration: duration, delay: 0, options: [.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
        } else {
            animations()
        }
    }
    
    @objc func keyBoardWillHide(_ note:NSNotification) {
        let userInfo  = note.userInfo
        let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations = {
            self.bottomUIView.transform = .identity
        }
        
        if duration > 0 {
            UIView.animate(withDuration: duration, delay: 0, options:[.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
        }else{
            animations()
        }
        
    }
    
    
}

extension ViewController: UITextViewDelegate {
    
    // Input TextView의 입력 수를 감지하여 제한을 둘 수 있는 delegate method
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputTextLength = text.count - range.length + textView.text.count
        
        if inputTextLength > 140 {
            return false
        }
        characterCountLabel.text = "\(140 - inputTextLength)"
        return true
    }
    
}
