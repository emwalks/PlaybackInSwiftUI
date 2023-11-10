//
//  ContentView.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in // get the geometry
                ScrollView {
                    VStack {
                        NavigationLink("VideoPlayer Fullscreen",
                                       destination: VideoPlayerFullscreenView())
                        .padding()
                        NavigationLink("VideoPlayer Embedded",
                                       destination: VideoPlayerEmbeddedView())
                        .padding()
                        NavigationLink("VideoPlayer Landscape",
                                       destination: VideoPlayerFSLandscapeView())
                        .padding()
                        NavigationLink("AVPlayer Fullscreen - Live",
                                       destination: AVPlayerVCFullscreen())
                        .padding()
                        NavigationLink("AVPlayer Portrait",
                                       destination: AVPlayerFSPortrait())
                        .padding()
                        
                    }
                    .padding()
                    .frame(width: geometry.size.width)  // Make the scroll view full-width
                    .frame(minHeight: geometry.size.height) // Set the content’s min height to the parent
                }
                .navigationTitle("EmPlayer")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
