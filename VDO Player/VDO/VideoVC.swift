//
//  VideoVC.swift
//  VDO Player
//
//  Created by Mayank Yadav on 01/09/22.
//
import Foundation
import UIKit
import AVFoundation
import AVKit

class VideoVC: UIViewController{
    
    var mainView = VideoPageView()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        view.sendSubviewToBack(mainView.videoView)
    }
    
}
