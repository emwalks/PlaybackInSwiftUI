//
//  VideoPlayerFSLandscapeView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerFSLandscapeView: View {
    let player = AVPlayer(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/adv_dv_atmos/main.m3u8")!)
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
                    AppDelegate.orientation = orientationOnAppear
                    player.pause()
                }
        }
    }
}

struct VideoPlayerFSLandscapeView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerFSLandscapeView()
    }
}
