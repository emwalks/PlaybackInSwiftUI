//
//  AVPlayerVCFullscreen.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover
// https://stackoverflow.com/questions/13145048/hls-avplayer-on-ios-return-to-live

struct AVPlayerVCFullscreen: View {
    
    // Live Akamai m3u8 HLS stream
    @State var player = AVPlayer(url: URL(string: "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8")!)
    
    var body: some View {
        AVPlayerView(player: player)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // seek to live edge
                guard let seekableRange = player.currentItem?.seekableTimeRanges.last as? CMTimeRange else {
                     return
                 }
                let livePosition = CMTimeRangeGetEnd(seekableRange)
                player.seek(to: livePosition)
                player.play()
            }
            .onDisappear{
                player.pause()
            }
    }
    
}

struct AVPlayerVCFullscreen_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerVCFullscreen()
    }
}
