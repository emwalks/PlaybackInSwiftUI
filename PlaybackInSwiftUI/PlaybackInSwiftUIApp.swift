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
        configureAudioSessionForVideoPlayback()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    
    private func configureAudioSessionForAudioPlayback() {
        
        do {
            try AVAudioSession.sharedInstance()
                .setCategory(.playback,
                             mode: .spokenAudio,
                             policy: .longFormAudio,
                             options: [.mixWithOthers, .allowAirPlay])
            print("AVAudioSession set")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
    }
    
    /*
     PiP video doesn’t play in ambient category.
     
     https://www.kodeco.com/22372639-video-streaming-tutorial-for-ios-getting-started?page=4#toc-anchor-012
     */
    private func configureAudioSessionForVideoPlayback() {
        do {
            try AVAudioSession.sharedInstance()
                .setCategory(.playback,
                             mode: .moviePlayback,
                             policy: .longFormVideo,
                             options: [.allowAirPlay])
            print("AVAudioSession set")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
    }
}
