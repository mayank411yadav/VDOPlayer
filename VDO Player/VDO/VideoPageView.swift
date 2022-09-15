//
//  VideoPageView.swift
//  VDO Player
//
//  Created by Mayank Yadav on 31/08/22.
//

import UIKit
import AVKit
import AVFoundation

class VideoPageView: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var btnPlay: UIButton!
    var parentVC : VideoVC!
    var player : AVPlayer!
    var playerLayer : AVPlayerLayer!
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        playVideo()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
        playVideo()
    }
    func initView(){
        Bundle.main.loadNibNamed("VideoPageView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    @IBAction func onClickedPlay(_ sender: UIButton) {
        if player.rate == 0 {
            player?.play()
        }
        else {
            player?.pause()
        }
    }
    func playVideo() {
        
        let url  = URL(string: "https://previews.customer.envatousercontent.com/h264-video-previews/b6bb6b57-4576-4e03-9510-0d14d070a548/27472602.mp4")
        player = AVPlayer(url: url!)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoView.layer.addSublayer(playerLayer)
        self.videoView.bringSubviewToFront(btnPlay)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = self.videoView.bounds
    }
}

