//
//  VideoPlayerPortraitView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

/*
 This is super gross - can't see the full range of AV player controls
 https://stackoverflow.com/questions/73992868/swiftui-how-to-resize-a-video-to-fill-all-vertical-iphone-while-maintaining-a
 */

struct VideoPlayerPortraitView: View {
    
    let player = AVPlayer(url: Bundle.main.url(forResource: "JebbersPortrait", withExtension: "mp4")!)
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VideoPlayer(player: player)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.height * 16 / 9, height: geometry.size.height)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    .onAppear() {
                        player.isMuted = false
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
            }
        }
    }
}

struct VideoPlayerPortraitView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerPortraitView()
    }
}
