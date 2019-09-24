//
//  ViewController.swift
//  VideoBackground
//
//  Created by youngjun goo on 23/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation
import MediaPlayer
import AVKit

// 값이 변경되지 않는 하나의 타입에 여러 옵션이나 메뉴가 존재할 시에는 아래와 같이 enum으로 관리하는 것이 효율 적이다.
public enum ScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

class ViewController: UIViewController {
    
    
    fileprivate let moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerSoundLevel: Float = 1.0
    var contentURL: URL? {
        didSet {
            if let _contentURL = contentURL {
                setMoviePlayer(_contentURL)
            }
        }
    }
    
    var videoFrame: CGRect = CGRect()
    var startTime: CGFloat = 0.0
    var duration: CGFloat = 0.0
    var backgroundColor: UIColor = UIColor.black {
        didSet {
            view.backgroundColor = self.backgroundColor
        }
    }
    var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            } else {
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = self.alpha
        }
    }
    var alwaysRepeat: Bool = true {
        didSet {
            if self.alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playerItemDidReachEnd),
                    name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                    object: moviePlayer.player?.currentItem)
            }
        }
    }
    var fillMode: ScalingMode = .resizeAspectFill {
        didSet {
            switch self.fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect
            case .resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            }
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        // 재생관련 컨트롤은 보지이 않게 한다.
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        // view 의하위의 sibling 뒤에(back) 나타나게 한다
        view.sendSubviewToBack(moviePlayer.view)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 옵저버 객체 삭제
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func setMoviePlayer(_ url: URL) {
        let videoCutter = VideoCutter()

        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) in
            if let path = videoPath as URL? {
                DispatchQueue.main.async {
                    self.moviePlayer.player = AVPlayer(url: path)
                    self.moviePlayer.player?.play()
                    self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func playerItemDidReachEnd() {
        // TODO: CMTime 관련 정리 필요
        moviePlayer.player?.seek(to: CMTime.zero)
        moviePlayer.player?.play()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVideoBackground()
        
        logInButton.layer.cornerRadius = 4
        signUpButton.layer.cornerRadius = 4
    }
    
    func setUpVideoBackground() {
        
        guard let urlPath = Bundle.main.path(forResource: "moments", ofType: "mp4") else {
            return
        }
        let url = URL(fileURLWithPath: urlPath)
        // superview의 전체 frame == 뒷배경
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 1.0
        
        contentURL = url
        // 왜 한번더 호출을 해주어야 하는지?
        // contentURL에 didSet이 변화를 감지하고 자동으로 callback 함수를 호출해주는 것이 아닌지?
        self.moviePlayer.player = AVPlayer(url: contentURL!)
        moviePlayer.player?.play()
        
    }

}

