//
//  VideoPlayerFullscreenView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker on 10/11/2023.
//

import SwiftUI
import AVKit

/*
 This is a very basic example of:
 - A fullscreen player
 - Playing HLS stream video
 - Autoplay on appear
 - Subtitles are available
 - Media Accessibility User Subtitles Styling is free
 - TODO: - check all lock screen / control center interactions
 - Note if you do not add the onDisappear pause, the video will continue to play when you leave the screen.
 */

struct VideoPlayerFullscreenView: View {
    @State var player = AVPlayer(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8")!)
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    // autoplay
                    player.play()
                }
                .onDisappear{
                    player.pause()
                }
        }
    }
}

struct VideoPlayerFullscreenView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerFullscreenView()
    }
}
