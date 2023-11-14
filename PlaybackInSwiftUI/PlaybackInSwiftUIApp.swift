//
//  PlaybackInSwiftUIApp.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import SwiftUI
import AVFoundation

@main
struct PlaybackInSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        setVideoPlaybackCategory()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    
    private func setMixWithOthersPlaybackCategory() {
        try? AVAudioSession.sharedInstance().setCategory(
            .ambient,
            mode: .moviePlayback,
            options: [.mixWithOthers])
        try? AVAudioSession.sharedInstance().setActive(true)
        print("Session is Active")
    }
    
    /*
     PiP video doesn’t play in ambient category.
     By setting mixWithOthers, you allow the user to decide when to pause rather
     Need to check HiG on this
     https://www.kodeco.com/22372639-video-streaming-tutorial-for-ios-getting-started?page=4#toc-anchor-012
     */
    private func setVideoPlaybackCategory() {
        do {
            try AVAudioSession.sharedInstance().setCategory(
                .playback,
                mode: .moviePlayback,
                options: [.mixWithOthers, .allowAirPlay])
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
        
    }
}
