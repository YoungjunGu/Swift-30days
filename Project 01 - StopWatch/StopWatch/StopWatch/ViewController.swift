//
//  ViewController.swift
//  StopWatch
//
//  Created by youngjun goo on 17/08/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    // MARK: Properties
    private var counter: Float = 0.0 {
        didSet {
            timeLabel.text = String(format: "%.1f", counter)
        }
    }

    private var timer: Timer? = Timer()
    private var isPlaying = false
    
    // MARK: IBAction
    @IBAction func resetButtonDidTouch(_ sender: UIButton) {
        if let timerTemp = timer {
            // timer를 정지 시키고 실행 루프를 제거한다.
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
        counter = 0
        startBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func playButtonDidTouch(_ sender: UIButton) {
        startBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: UIButton) {
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.counter = 0.0
    }
    
    @objc func updateTimer() {
        counter = counter + 0.1
    }
    

}

extension ViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return UIStatusBarStyle.lightContent
    }

}

