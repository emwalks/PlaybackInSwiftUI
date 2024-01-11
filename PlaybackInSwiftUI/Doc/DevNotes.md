#  Dev Notes

// TODO: Can we add a listener to update based on player state so it updates for AVPlayer native controls too

// TODO:  fix warning
UIViewController.attemptRotationToDeviceOrientation()

## Links

iOS 16 rewrite of standard AVPlayers https://developer.apple.com/videos/play/wwdc2022/10147/

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

https://medium.com/free-code-camp/how-to-set-up-video-streaming-in-your-app-with-avplayer-7dc21bb82f3

https://ottverse.com/free-hls-m3u8-test-urls/

https://developer.apple.com/design/human-interface-guidelines/playing-audio

https://developer.apple.com/design/human-interface-guidelines/playing-video

https://stackoverflow.com/questions/13145048/hls-avplayer-on-ios-return-to-live

https://www.kodeco.com/22372639-video-streaming-tutorial-for-ios-getting-started?page=4#toc-anchor-012

https://www.wwdcnotes.com/topics/Audio&Video/

https://developer.apple.com/videos/play/wwdc2019/503/

https://developer.apple.com/documentation/avkit/playing_video_content_in_a_standard_user_interface

https://www.avanderlee.com/swiftui/sfsafariviewcontroller-open-webpages-in-app/?utm_campaign=coschedule&utm_source=linkedin&utm_medium=%F0%9F%9A%80%20Antoine%20van%20der%20Lee

-> check out how to make a reusable UIKit bridge

https://technology.mlblogs.com/leveraging-swiftui-for-video-playback-in-ios-part-1-of-2-e1133caa4e1c

# Hook into Native Experience

- Control Center 
- Lock Screen
- Metadata etc

https://developer.apple.com/videos/play/wwdc2022/10147/

# Some AV Player Internals to consider

https://developer.apple.com/documentation/avfoundation/avplayeritem

https://www.mux.com/blog/background-audio-handling-with-ios-avplayer

From the tests I did, I did not see AVPlayer automagically doing the switch to the audio-only rendition for us. So I decided to commit some mild crimes in order to make it work. For better or worse iOS and AVPlayer hold a really strong stance around messing with the internals of how the streaming works. In fact, really the only two handles they give you into that world are preferredPeakBitRate and preferredForwardBufferDuration. Even with these two properties, AVPlayer merely takes them as “suggestions” which basically means don’t be surprised if your suggestions are completely ignored, AVPlayer reserves the right to use whatever bitrate and forward buffer it wants.

Configuring Network Behavior

https://developer.apple.com/documentation/avfoundation/avplayeritem/1388541-preferredpeakbitrate

https://developer.apple.com/documentation/avfoundation/avplayeritem/1388752-canusenetworkresourcesforlivestr

https://developer.apple.com/documentation/avfoundation/avplayeritem/1643630-preferredforwardbufferduration


# MediaServicesWereReset

TODO: Although this is an audio session releated notification if you use trigger the reset the video is completely borked.

# Observing playback readiness

https://developer.apple.com/documentation/avfoundation/media_playback/controlling_the_transport_behavior_of_a_player

The seek(to:) method is a convenient way to quickly seek through your presentation, but it’s tuned for speed rather than precision. This means the actual time to which the player seeks may differ slightly from the time you request. If you need to implement precise seeking behavior, use the seek(to:toleranceBefore:toleranceAfter:) method, which lets you indicate the tolerated amount of deviation from your target time (before and after). For example, if you need to provide sample-accurate seeking behavior, specify tolerance values of zero:

// Seek precisely to the specified time.
await avPlayer.seek(to: time, toleranceBefore: .zero, toleranceAfter: .zero)

https://developer.apple.com/documentation/avfoundation/media_playback

# AVAudio Session routing changes

https://developer.apple.com/documentation/avfaudio/responding_to_audio_route_changes

# Converting Video to GIFs using FFMPEG

`$ ffmpeg -i input.mp4 -filter_complex "fps=15,scale=540:-1[s]; [s]split[a][b]; [a]palettegen[palette]; [b][palette]paletteuse" output_as_540px.gif`

https://creatomate.com/blog/how-to-make-a-gif-from-a-video-using-ffmpeg

# BBC Test Streams

https://rdmedia.bbc.co.uk/testcard/simulcast/

# Accessibility in Swift UI

- [ ] Substitles
- [ ] Hooking into user settings for subs and captions
- [ ] Stnadard Player VoiceOver experience (subs button missing iOS 15? )
- [ ] Increase contrast? 
- [ ] Reduce transparancy? On the pre iOS 16 chrome standard player UI responds to this

## Reduce transparency feature on iOS 

- Settings > Accessibility > Display & Text Size
- it's common for folks with low vision to use the visual accommodation settings on the platform.
- On iOS standard UIKit framework views and controls come with display accommodations included for free - so users personalisation settings are supported out of the box.
- If you're using custom views you need to enure display accommodations are supported utilising `isReduceTransparencyEnabled` 

- Design: Include design variations for transparent and opaque backgrounds on UI elements.
- Development: Determine if the user has enabled "Reduce Transparency" by checking the state of `UIAccessibilityIsReduceTransparencyEnabled()`. Update the UI accordingly.
- Development: Determine if the user has adjusted the "Reduce Transparency" setting whilst using the app by listening for a notification from `UIAccessibilityReduceTransparencyStatusDidChange`. Update the UI accordingly.

Resources: Check swiftUI equivalence? 
https://support.apple.com/en-uz/guide/iphone/iph3e2e1fb0/ios#:~:text=easier%20to%20see.-,Go%20to%20Settings%20%3E%20Accessibility%20%3E%20Display%20%26%20Text%20Size.,Turn%20on%20Reduce%20Transparency.

https://developer.apple.com/documentation/uikit/uiaccessibility/1615074-isreducetransparencyenabled

Note there isn't an equivalent for Android, so its be a case of exceeding baseline colour contrast guidance there.


# User Experiences Examples To Demo

- [x] iOS 16 Standard Media Player UI updates
- [x] iOS 17 Standard Media Player UI updates
        [iOS16_iOS17_SystemMediaPlayers_updates.md](./iOS16_iOS17_SystemMediaPlayers_updates.md)
- [x] VideoPlayer Full Screen (based on current orientation)
- [x] VideoPlayer Full screen force landscape
- [x] VideoPlayer Vertical / Portrait 
    - [x] Tried https://stackoverflow.com/questions/73992868/swiftui-how-to-resize-a-video-to-fill-all-vertical-iphone-while-maintaining-a but need to try generalise - do you need to know the video aspect ratio? Can you get it from asset? 
        This is super gross - can't see full AVPlayer controls. See VideoPlayerPortraitView.swift
- [x] VideoPlayer Embedded
    - [ ] Is it possible to add a observer/listener to update the native controls as well as additional controls?
        https://developer.apple.com/documentation/avfoundation/avplayer/1385829-addperiodictimeobserver
- [ ] VideoPlayer add image over player view
    https://www.hackingwithswift.com/quick-start/swiftui/how-to-play-movies-with-videoplayer
- [x] AVPlayerView Player Full Screen (based on current orientation)
- [x] AVPlayerView Full screen force landscape
- [ ] AVPlayerView Embedded to Fullscreen 
     https://github.com/adamzarn/AZVideoPlayer
     https://stackoverflow.com/questions/67824702/how-to-go-full-screen-with-videoplayer-in-swiftui
     https://developer.apple.com/forums/thread/131762
     https://technology.mlblogs.com/leveraging-swiftui-for-video-playback-in-ios-part-1-of-2-e1133caa4e1c
     https://developer.apple.com/documentation/avfoundation/avplayer/1385829-addperiodictimeobserver
- [x] AVPlayerView Vertical / Portrait Video 
    - [x] Try https://stackoverflow.com/questions/73992868/swiftui-how-to-resize-a-video-to-fill-all-vertical-iphone-while-maintaining-a but need to try generalise - do you need to know the video aspect ratio? Can you get it from asset? 
        
- [ ] AVPlayerView / VideoPlayer In line / mini player (embedded inline)
     https://developer.apple.com/documentation/avkit/playing_video_content_in_a_standard_user_interface
     https://developer.apple.com/videos/play/wwdc2019/503/
- [ ] AVPlayerView / VideoPlayer Swipe to floating mini player
- [x] PiP (has to be AVPlayerVC)
    - [ ] Changing the PiP controlls
- [x] Airplay ("free" with standard player?)
- [ ] HDMI / Bluetooth/ Peripherals
- [ ] Chromecast
- [x] Multitasking - split view / scroll over
    - [ ] Working but need to check audio session mixing options? Works on real device for PiP
    - [ ] nice fade in/out not jarring to audience
- [ ] Custom UI
- [x] Subtitles ("free" with standard player)
    - [x] Supports multiple subtitle tracks
    - [x] Repsonds to MediaAccessibility API in settings
    - [x] Does not fully support [EBU-TT-D positions](EBUTDD_PositionalSubtitles.md)
- [x] Playback rate ("free" with standard player on iOS 16)
    - [x] gets reset to x1 at live edge automatically 
- [x] Gravity ("free" with standard player has UI button)
- [ ] DASH support? 
- [x] Live video
    - [ ] instead of time behind live on transport control you might want to show actual time... 
    - [ ] Note with this live stream while airplaying the subs get colored but on device just white... 
- [x] On demand HLS streaming
- [x] Content from bundle
- [ ] Audio (prob makes sense to do it from mini player)
- [ ] Placeholder image for audio
- [ ] Hooking into the native control center 
    - [x] Checked with AVPlayerVC ("free" with standard player - lock screen yes, control center yes)
    - [x] Checked with VideoPlayer ("free" with standard player - lock screen yes, control center yes)
    - [ ] Putting in a holding image for playback here? 
- [ ] DRM with Fairplay?
    - [ ] Not backing up to iCloud
- [ ] Audio ducking/interruption behaviour ( depends on AVAudioSession options ducking with playback .default/.moviePlayback, pause rather than duck with playback .spokenAudio) 
    - [ ] Checked with AVPlayerVC 
    - [ ] Checked with VideoPlayer 
- [ ] Responding to media services were reset notification
    - [ ] Why might you care for video? Your PiP behaviour requires the AVAudio Session
    - [ ] Make sure you only play following a CTA!!
- [ ] Monitoring playback
- [ ] Changing  Network Behaviour of AVPlayer
- [ ] Thumbnail Scrubbing
- [ ] No live rewind
- [ ] Audio ducking
- [ ] Accessibility of the standard AVPlayerVC / VideoPlayer? 
    - [x] for pre-iOS 16 where the standard player has Chrome UI - responds to "Reduce Transparency" by becoming more opaque
    - [ ] Need to check VoiceOver experience
    - [ ] Need to check reponse to keyboard / inputs
    - [x] Multi Audio track support ("free" with standard player)
    - [x] Media Accessibility Subtitle Support ("free" with standard player)
- [ ] Presenting Navigation Markers 
        https://developer.apple.com/documentation/avkit/presenting_navigation_markers
- [ ] Working with Interstitial Content / Ad insertion
        https://developer.apple.com/documentation/avkit/working_with_interstitial_content
- [ ] I need to do some research on SwiftUI View lifecycle, updates, and e.g. passing player from embedded to fullscreen and back maintaining continuity of playback
- [ ] Using info.plist rather than storyboard for launch screen

