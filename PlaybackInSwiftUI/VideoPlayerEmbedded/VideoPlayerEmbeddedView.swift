//
//  VideoPlayerEmbeddedView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//
import AVKit
import SwiftUI

// https://developer.apple.com/documentation/avkit/videoplayer

struct VideoPlayerEmbeddedView: View {
    @State var player = AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
        @State var isPlaying: Bool = false
        
        var body: some View {
            VStack {
                VideoPlayer(player: player)
                    .frame(width: 320, height: 180, alignment: .center)
                    .onDisappear{
                        player.pause()
                    }
                HStack {
                    Button {
                        player.seek(to: .zero)
                    } label: {
                        Image(systemName: "backward.end.circle.fill")
                            .padding()
                    }
                    Button {
                        // CTA based play
                        // note the button icon won't update based on the additional user control!! 
                        // can you add a listener to the player?
                        isPlaying ? player.pause() : player.play()
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .padding()
                    }

                }

            }
        }
}

struct VideoPlayerEmbeddedView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerEmbeddedView()
    }
}
