#  Dev Notes

// TODO: Can we add a listener to update based on player state soit updates for AVPlayer native controls too
// TODO: - Check all lock screen / control center interactions VideoPlayer
// TODO: - Check all lock screen / control center interactions VideoPlayer

// TODO:  fix warning
UIViewController.attemptRotationToDeviceOrientation()

## Links

https://developer.apple.com/streaming/examples/

https://devstreaming-cdn.apple.com/videos/streaming/examples/historic_planet_content_2023-10-26-3d-video/main.m3u8

https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8

https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8

https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8

 https://developer.apple.com/documentation/avkit/videoplayer
 
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-draw-a-border-around-a-view
 
 https://www.polpiella.dev/changing-orientation-for-a-single-screen-in-swiftui
 
 https://stackoverflow.com/questions/67035307/swiftui-how-to-force-landscape-without-appdelegate -> Couldn't get this one to work

https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app

https://stackoverflow.com/questions/75270101/swiftui-force-device-rotation-programmatically

https://developer.apple.com/forums/thread/125155

https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit

https://developer.apple.com/videos/play/wwdc2022/10147/

 https://developer.apple.com/documentation/avkit/playing_video_content_in_a_standard_user_interface
 https://stackoverflow.com/questions/58034049/swiftui-how-to-properly-present-avplayerviewcontroller-modally

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover

// https://stackoverflow.com/questions/58034049/swiftui-how-to-properly-present-avplayerviewcontroller-modally

https://www.kodeco.com/24247382-picture-in-picture-across-all-platforms

https://www.kodeco.com/books/swiftui-cookbook/v1.0/chapters/4-playing-audio-video-in-the-background-in-swiftui

## Supporting PiP

https://www.kodeco.com/24247382-picture-in-picture-across-all-platforms

https://www.kodeco.com/books/swiftui-cookbook/v1.0/chapters/4-playing-audio-video-in-the-background-in-swiftui

- Enable Background Modes in:
    App Target > Signing & Capabilities > + Capability > Background Modes > Audio, Airplay and Picture in Picture
- Where @main is declared (normally AppDelegate.swift. ) set AVAudioSession categories

Or if you don't have an 
```swift
    private func setMixWithOthersPlaybackCategory() {
      try? AVAudioSession.sharedInstance().setCategory(
        AVAudioSession.Category.ambient,
        mode: AVAudioSession.Mode.moviePlayback,
        options: [.mixWithOthers])
    }
    
    private func setVideoPlaybackCategory() {
      try? AVAudioSession.sharedInstance().setCategory(.playback)
    }
```
In full screen VC
        controller.allowsPictureInPicturePlayback = true
        controller.canStartPictureInPictureAutomaticallyFromInline = true
        return controller

 Additionally, you’ll need to run this app on a physical device to test background playback
