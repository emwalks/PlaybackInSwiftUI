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
    
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "FrontFlip", withExtension: "mp4")!)
    
    var body: some View {
        AVPlayerVCView(player: player)
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
