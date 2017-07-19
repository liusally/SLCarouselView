//
//  ViewController.swift
//  SLCarouselViewExample
//
//  Created by Shali Liu on 7/19/17.
//  Copyright © 2017 Shali Liu. All rights reserved.
//

import UIKit
import AVFoundation
import SDWebImage
import SLCarouselView

class ViewController: UIViewController {
    
    
    @IBOutlet var carouselView: SLCarouselView!
    
    fileprivate var playerArr = [AVPlayer?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data examples
        let data: [Dictionary<String, String>] = [
            ["type": "image", "url": "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/20065243_243723416143011_6663416918206054400_n.jpg"],
            ["type": "image", "url": "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/19984908_462044610837470_639420776679735296_n.jpg"],
            ["type": "image", "url": "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/19955017_1738275873137290_7355135153712136192_n.jpg"],
            ["type": "video", "url": "https://scontent.cdninstagram.com/t50.2886-16/19179996_870131086458262_8352073221473828864_n.mp4"]
        ]
        setupCarouselView(data: data)
    }
    
    private func setupCarouselView(data: [Dictionary<String, String>]) {
        
        for index in 0...(data.count - 1) {
            let item = data[index]
            if (item["type"] == "image") {
                // image
                let imageUrl = item["url"]
                let imageSlide = UIImageView()
                
                imageSlide.contentMode = UIViewContentMode.scaleAspectFill
                imageSlide.clipsToBounds = true
                imageSlide.sd_setImage(with: URL(string: imageUrl!))
                
                self.carouselView.appendContent(view: imageSlide)
            }
            
            if (item["type"] == "video") {
                // video
                let videoView = UIView()
                self.carouselView.appendContent(view: videoView)
                
                let videoUrl = item["url"]
                let player = AVPlayer(url: URL(string: videoUrl!)!)
                self.playerArr.append(player)
                // Mute video
                player.volume = 0
                
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = videoView.bounds
                
                videoView.layer.addSublayer(playerLayer)
                // Resize video to frame
                playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                // Loop playing video
                NotificationCenter.default.addObserver(self, selector: #selector(self.loopPlayVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
                player.play()
                
            }
            
        }
        
    }
    
    func loopPlayVideo() {
        
        for player in self.playerArr {
            player?.seek(to: kCMTimeZero)
            player?.play()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

