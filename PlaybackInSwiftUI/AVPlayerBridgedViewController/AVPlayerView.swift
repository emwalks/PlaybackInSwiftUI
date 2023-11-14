//
//  AVPlayerView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

/*
 This is an example of:
 - an AVPlayerViewController being bridged into SwiftUI using UIViewControllerRepresentable.
 - A fullscreen player that can be configured to open in portrait view
 - Supports Pictue in picture (PiP) and Airplay playback
    - Note you must also configure your AVAudioSession correctly to support PiP
    - You must also enable the background execution mode "Audio, AirPlay, and Picture in Picture"
 - TODO: - Media Accessibility User Subtitles Styling is free
 - TODO: - Check all lock screen / control center interactions
 */

// https://www.createwithswift.com/implementing-picture-in-picture-with-avkit-and-swiftui/

// https://stackoverflow.com/questions/58034049/swiftui-how-to-properly-present-avplayerviewcontroller-modally

// https://developer.apple.com/documentation/avkit/adopting_picture_in_picture_in_a_standard_player

struct AVPlayerView: UIViewControllerRepresentable {
    let player: AVPlayer?
    var portraitMode = false
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.modalPresentationStyle = .fullScreen
        if portraitMode {
            // Vertical View - can't access on VideoPlayer :(
            controller.videoGravity = .resizeAspectFill
        }
        controller.player = player
        controller.allowsPictureInPicturePlayback = true
        controller.canStartPictureInPictureAutomaticallyFromInline = true
        return controller
    }
    
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {

    }
    
}
