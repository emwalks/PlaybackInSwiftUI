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
            AVAudioSession.Category.ambient,
            mode: AVAudioSession.Mode.moviePlayback,
            options: [.mixWithOthers])
    }
    
    private func setVideoPlaybackCategory() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: [.mixWithOthers, .allowAirPlay])
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
        
    }
}
