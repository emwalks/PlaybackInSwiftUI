//
//  AVPlayerVCView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

// https://www.createwithswift.com/implementing-picture-in-picture-with-avkit-and-swiftui/

// https://stackoverflow.com/questions/58034049/swiftui-how-to-properly-present-avplayerviewcontroller-modally

// https://developer.apple.com/documentation/avkit/adopting_picture_in_picture_in_a_standard_player

struct AVPlayerVCView: UIViewControllerRepresentable {
    let player: AVPlayer?
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.player = player
        controller.allowsPictureInPicturePlayback = true
        controller.canStartPictureInPictureAutomaticallyFromInline = true
        return controller
    }
    
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {

    }
    
}
