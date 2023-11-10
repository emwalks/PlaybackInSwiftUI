//
//  AVPlayerVCView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

// https://stackoverflow.com/questions/58034049/swiftui-how-to-properly-present-avplayerviewcontroller-modally

struct AVPlayerVCView: UIViewControllerRepresentable {
    let player: AVPlayer?
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.player = player
        return controller
    }
    
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
//        playerController.modalPresentationStyle = .fullScreen
//        playerController.player = player
//        playerController.player?.play()
    }
    
}
