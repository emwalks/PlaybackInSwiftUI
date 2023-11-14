//
//  VideoPlayerFSLandscapeView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

/*
 This is an example of:
 - A fullscreen player that only plays in landscape mode
 - Playing HLS stream video
 - Autoplay on appear
 - Subtitles are available
 - Alternative Language tracks are available
 - Media Accessibility User Subtitles Styling is free
 - TODO: - check all lock screen / control center interactions
 - Note if you do not add the onDisappear pause, the video will continue to play when you leave the screen.
 */

struct VideoPlayerFSLandscapeView: View {
    // if this player isn't @State var, the video continues in the background!
    @State var player = AVPlayer(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/adv_dv_atmos/main.m3u8")!)
    @State var orientationOnAppear: UIInterfaceOrientationMask!

    var body: some View {
        VStack {
            
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    // autoplay
                    orientationOnAppear = AppDelegate.orientation
                    AppDelegate.orientation = .landscape
                    player.play()
                }
                .onDisappear {
                    player.pause()
                    AppDelegate.orientation = orientationOnAppear
                }
        }
    }
}

struct VideoPlayerFSLandscapeView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerFSLandscapeView()
    }
}
