//
//  AVPlayerVCFullscreen.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

/*
 This is an example of:
 - A fullscreen player playing back live content
 - When loaded, the content starts playing at the live edge
 - This is an example of interacting with the player items' seekable range
 - This live stream has multiple audio languge tracks, audio described tracks and multiple language subtitle track
 */

struct AVPlayerVCFullscreenLive: View {
    
    @State var player = AVPlayer(url: URL(string: "https://rdmedia.bbc.co.uk/testcard/simulcast/manifests/avc-mobile.m3u8")!)
    
    var body: some View {
        AVPlayerView(player: player)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // seek to live edge
                guard let seekableRange = player.currentItem?.seekableTimeRanges.last as? CMTimeRange else {
                     return
                 }
                let livePosition = CMTimeRangeGetEnd(seekableRange)
                // Add more precise seek to ensure you seek to live edge.
                // Though there is a time penalty to this - https://developer.apple.com/documentation/avfoundation/media_playback/controlling_the_transport_behavior_of_a_player
                player.seek(to: livePosition, toleranceBefore: .zero, toleranceAfter: .zero)
                player.play()
            }
            .onDisappear{
                player.pause()
            }
    }
    
}

struct AVPlayerVCFullscreen_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerVCFullscreenLive()
    }
}
