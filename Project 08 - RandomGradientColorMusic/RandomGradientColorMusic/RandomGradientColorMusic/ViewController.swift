//
//  ViewController.swift
//  RandomGradientColorMusic
//
//  Created by youngjun goo on 18/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var musicPlayButton: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    var timer = Timer()
    
    var backgroundColor: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)! {
        didSet {
            let color1 = UIColor(red: backgroundColor.blue, green: backgroundColor.green, blue: 0, alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: backgroundColor.red, green: backgroundColor.green, blue: backgroundColor.blue, alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1, color2]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func playMusicButtonDidTouch(_ sender: AnyObject) {
        
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
            self.audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch let audioError as NSError {
            print(audioError)
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        }
        
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.addSublayer(gradientLayer)
    }
    

    
    @objc func randomColor() {
        
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        backgroundColor = (redValue, blueValue, greenValue, 1)
        print("Callback method")
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        timer.invalidate()
        print("sound is clear")
    }


}

