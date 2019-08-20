//
//  ViewController.swift
//  PlayVideo
//
//  Created by youngjun goo on 20/08/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var videoTableView: UITableView!
    private var cellIdentifier = "VideoCell"
    
    private var videoData = [
        Video(image: "videoScreenshot01",
              title: "Introduce 3DS Mario",
              source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(image: "videoScreenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30")
    ]
    
    private var playViewController = AVPlayerViewController()
    private var playerView = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 코드로서 delegate, dataSource를 적용
        videoTableView.dataSource = self
        videoTableView.delegate = self
    }
    
    // MARK : video 재생
    @IBAction func playVideoButtonDidTouch(_ sender: AnyObject) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! VideoCell
        let video = videoData[indexPath.row]
        
        cell.videothumbnail.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        
        return cell
    
    }
    
    
}
