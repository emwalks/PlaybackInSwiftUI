//
//  VideoPlayerFullscreenView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker on 10/11/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerFullscreenView: View {
    @State var player = AVPlayer(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8")!)
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
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
