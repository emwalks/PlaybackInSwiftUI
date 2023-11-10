//
//  AVPlayerVCFullscreen.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover

struct AVPlayerVCFullscreen: View {
    
    // Live Akamai m3u8 HLS stream
    @State var player = AVPlayer(url: URL(string: "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8")!)
    
    var body: some View {
        AVPlayerView(player: player)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
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
