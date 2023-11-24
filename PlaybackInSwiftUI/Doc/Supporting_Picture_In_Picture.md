#  Supporting Picture in Picture

# Essentials

https://developer.apple.com/documentation/avfoundation/media_playback/configuring_your_app_for_media_playback

[Configure the audio session for playback](#1-configure-the-audio-session-for-playback)
[Enable Background Execution Mode](#2-enable-background-execution-mode)
[ In your AVPlayerViewController](#3-in-your-avplayerviewcontroller)

## 1. Configure the audio session for playback

```swift

// E.g. call in your player model. main, app delegate etc. 
    
    func configureAudioSessionForVideoPlayback() {
        do {
            try AVAudioSession.sharedInstance()
                .setCategory(.playback,
                             mode: .moviePlayback,
                             options: [.allowAirPlay])
            print("AVAudioSession set")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
    }

```

The [`.playback`](https://developer.apple.com/documentation/avfaudio/avaudiosession/category/1616509-playback) category meaning:

> Sound is essential and might mix with other audio. For example, an audiobook or educational app that teaches a foreign language, which people might want to listen to after leaving the app. 

And behaviour:

> Doesn’t respond to the silence switch. May or may not mix with other sounds. Can play in the background.
> _(https://developer.apple.com/design/human-interface-guidelines/playing-audio)_

The [`.moviePlayback`](https://developer.apple.com/documentation/avfaudio/avaudiosession/mode/1616623-movieplayback) mode benefit:

> When you set this mode, the audio session uses signal processing to enhance movie playback for certain audio routes such as built-in speaker or headphones.

See links for information on the [mode](https://developer.apple.com/documentation/avfaudio/avaudiosession/mode), [options](https://developer.apple.com/documentation/avfaudio/avaudiosession/categoryoptions) and [routing policy](https://developer.apple.com/documentation/avfaudio/avaudiosession/routesharingpolicy) you may wish to configure. 

Based on Apple's Human Interface Guidelines for [playing video](https://developer.apple.com/design/human-interface-guidelines/playing-video)

> Avoid allowing audio from different sources to mix as viewers switch between modes.

Be cautious of enabling the `.mixWithOthers` option for video. 

It _may_ be appropriate to enable this option if you always set your video to mute on playback. 

If you play both audio and video in your app you may have different behaviour for your `AVAudioSession` for audio.

```swift

    func configureAudioSessionForAudioPlayback() {
        do {
            try AVAudioSession.sharedInstance()
                .setCategory(.playback,
                             mode: .default,
                             policy: .longFormAudio,
                             options: [.allowAirPlay])
            print("AVAudioSession set")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
    }
```

If the audio is primarily continuous spoken audio (audiobooks, podcasts) you may wish to set the [`.spokenAudio`](https://developer.apple.com/documentation/avfaudio/avaudiosession/mode/1616510-spokenaudio) mode:

> Setting this mode indicates that your app should pause, rather than duck, its audio if another app plays a spoken audio prompt. After the interrupting app’s audio ends, you can resume your app’s audio playback.

Set the audio session's routing policy to `.longFormAudio`. Longform audio is anything other than system sounds, such as music or podcasts.

See Supporting_Airplay.md for more on Routing Policies. 

## 2. Enable Background Execution Mode

You must [enable](https://developer.apple.com/documentation/avfoundation/media_playback/configuring_your_app_for_media_playback#4182619) "Audio, AirPlay, and Picture in Picture" background execution mode in Xcode:

## 3. In your AVPlayerViewController/View

```swift
// E.g. 
        controller.allowsPictureInPicturePlayback = true
        return controller
```

PiP playback starts when the user selects the PiP button in the player interface. In iOS and iPadOS, PiP playback starts automatically if your video is playing in full-screen mode and the user exits the app. 

When a video isn’t filling the entire screen in width, use `canStartPictureInPictureAutomaticallyFromInline` to indicate a video is the primary focus. 

In either case, the player window minimizes to a movable, floating window. In general, the system automatically pauses the video upon scene backgrounding, so you don’t need to pause video based on activation state.

If PiP isn't starting automatically when you background your video app ensure the following is set: 

Settings > General > Picture in Picture > Start PiP Automatically toggle On

https://developer.apple.com/documentation/avkit/adopting_picture_in_picture_in_a_standard_player#2948600

# 4. Testing PiP

It's best to test PiP on a physical device. PiP not available on iPhone simulators (is available on iPad sims). 
 
# Customising PiP System Controls

## Hide skip forward and back buttons

 If you need to restrict skipping content for legal disclaimers or advertisements, use [`requiresLinearPlayback`](https://developer.apple.com/documentation/avkit/avpictureinpicturecontroller/3566335-requireslinearplayback) during the required section of your video. Set this property back to false once you can allow seeking again.

https://developer.apple.com/documentation/avkit/adopting_picture_in_picture_in_a_standard_player#2948600

## Changing PiP Playback Controls Style

Using KVO, set `AVPlayerViewControlsStyle` on a custom PiP View Controller to whatever is required.

https://stackoverflow.com/questions/67528832/how-to-hide-system-controls-on-avpictureinpicturecontrollers-float-window#67528832

https://developer.apple.com/documentation/avkit/avplayerviewcontrolsstyle#1608978
 
# Resources

https://developer.apple.com/documentation/avfoundation/media_playback/configuring_your_app_for_media_playback

https://developer.apple.com/design/human-interface-guidelines/playing-audio

https://developer.apple.com/design/human-interface-guidelines/playing-video

https://www.kodeco.com/24247382-picture-in-picture-across-all-platforms

https://www.kodeco.com/books/swiftui-cookbook/v1.0/chapters/4-playing-audio-video-in-the-background-in-swiftui

https://developer.apple.com/documentation/avfaudio/avaudiosession 

https://developer.apple.com/videos/play/wwdc2020/10176/
