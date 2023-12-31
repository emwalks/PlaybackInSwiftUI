//
//  AVPlayerFSPortrait.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

/*
 This is an example of:
 - A fullscreen player playing back progressive content from the bundle
 - This is launched by default in Portrait/ Vertical Video mode
 */

struct AVPlayerFSPortrait: View {
        
    // loading a local item from bundle
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "JebbersPortrait", withExtension: "mp4")!)
    
    var body: some View {
        AVPlayerView(player: player, portraitMode: true)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                player.play()
            }
            .onDisappear{
                player.pause()
            }
    }
}

struct AVPlayerFSPortrait_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerFSPortrait()
    }
}
