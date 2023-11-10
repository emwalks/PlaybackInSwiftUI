//
//  VideoPlayerEmbeddedView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//
import AVKit
import SwiftUI

/*
 This is an example of:
 - An embedded player
 - With additional user controls (restart)
 - Playing an .mp4 video
 - Call To Action (CTA) based play -> does not autoplay
 - Note the additional CTA icon won't update based on the AVPlayer controls! Only on the additional control interactions.
 - Note if you do not add the onDisappear pause, the video will continue to play when you leave the screen.
 
 This example is based on the Apple VideoPlayer documentation.
 https://developer.apple.com/documentation/avkit/videoplayer

 */

struct VideoPlayerEmbeddedView: View {
    
    @State var player = AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
    @State var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(width: 320, height: 180, alignment: .center)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8,
                                     style: RoundedCornerStyle.continuous)
                        .stroke(.blue, lineWidth: 1))
                .onDisappear{
                    player.pause()
                }
            HStack {
                Button {
                    player.seek(to: .zero)
                } label: {
                    Image(systemName: "backward.end.fill")
                        .padding()
                }
                Button {
                    // TODO: Can we add a listener to update based on player state soit updates for AVPlayer native controls too
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
