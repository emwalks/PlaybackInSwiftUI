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

https://medium.com/free-code-camp/how-to-set-up-video-streaming-in-your-app-with-avplayer-7dc21bb82f3

https://ottverse.com/free-hls-m3u8-test-urls/

https://developer.apple.com/design/human-interface-guidelines/playing-audio

https://developer.apple.com/design/human-interface-guidelines/playing-video


Hello,

I would share an HLS stream having :
. 6 video qualities for Adaptive Bitrate
. 2 alternate audio tracks (English and French)
. 3 alternate subtitle tracks (English, English with audio description and French)

This movie works pretty well on any iOS devices and with Mac OS X operating systems. I think you could be interested in to check your developments or to test the capabilities of your favourite video player.

Here is this HLS link :
http://sample.vodobox.com/planete_interdite/planete_interdite_alternate.m3u8

https://git-lfs.com/

// https://stackoverflow.com/questions/13145048/hls-avplayer-on-ios-return-to-live


## Hook into Native Experience

- Control Center 
- Lock Screen
- Metadata etc

https://developer.apple.com/videos/play/wwdc2022/10147/

## Some AV Player Internals to consider

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

`$ ffmpeg -i input.mp4 -filter_complex "fps=15,scale=540:-1[s]; [s]split[a][b]; [a]palettegen[palette]; [b][palette]paletteuse" Aoutput_as_540px.gif`

https://creatomate.com/blog/how-to-make-a-gif-from-a-video-using-ffmpeg
