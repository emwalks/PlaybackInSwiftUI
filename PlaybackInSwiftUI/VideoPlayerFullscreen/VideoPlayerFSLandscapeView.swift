//
//  VideoPlayerFSLandscapeView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerFSLandscapeView: View {
    @State var player = AVPlayer(url: URL(string: "")!)
    
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

struct VideoPlayerFSLandscapeView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerFSLandscapeView()
    }
}
