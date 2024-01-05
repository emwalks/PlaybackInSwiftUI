#  iOS 16 System Media Players Update

[Create a great video playback experience](https://developer.apple.com/videos/play/wwdc2022/10147/)

- Playback Rate / Speeds out of the box
- Interstitials experiences

Based on tvOS Player improvements

## UI Updates 

- Centralised CTA buttons - no longer at the bottom
- Removed chrome across the board 

iOS 15
<img src="../Local Media/DocumentationMedia/iOS15_Chrome.PNG"/> 

iOS 16
<img src="../Local Media/DocumentationMedia/iOS16_NoChrome.png"/>

- ± 15s now *± 10s*. True of system player and PiP experience
- Remove slider indicator for current position
- Allow scrubbing / dragging from anywhere in the timeline OR video view - pretty cool feature. 
    When in video view other controls not visible just scrub bar
    (no thumbnail scrubbing though)

<img src="../Local Media/DocumentationMedia/iOS16_TimelineScrub.gif"/>

- Changed the aspect control UI + incorporated pinch to zoom
- Optimised for portrait view too
- For iPad, supports using with keyboard, trackpad, mice
- Play/pause with single tap in center even while controls are hidden
- display metadata from media automatically in overlay (title, subtitle, info)
- Or override the metadata from item:

```swift
// Setting content external metadata

let titleItem = AVMutableMetadataItem()
titleItem.identifier = .commonIdentifierTitle
titleItem.value = // Title string

let subtitleItem = AVMutableMetadataItem()
subtitleItem.identifier = .iTunesMetadataTrackSubTitle
subtitleItem.value = // Subtitle string

let infoItem = AVMutableMetadataItem()
infoItem.identifier = .commonIdentifierDescription
infoItem.value = // Descriptive info paragraph

playerItem.externalMetadata = [titleItem, subtitleItem, infoItem]
```
## What makes a media experince great?

- Intuitive - it should feel easy, familiar, natural, even if you've never used it. 
    - Feels Familiar
    - Use platform paradigms (e.g. TV remotes, tapping a volume button on a touch first device will mute the audio)
        - Modal presentation (appear from bottom) sugests a user can dismiss the player by a swipe down gesture
     - Real word example -> momentum based scroll on timeline only in full screen

- Integrated both within your app and with the system.
    - Use AVPlayerViewController on tvOS +++ 
    - PiP
    - control center now playing
    - CoreSpotlight integration to make your content searchable
    - MediaRemote commands allowing your app to respond to things like the play button being pressed on a keyboard or TV remote. 
    - TV App integration
    - Airplay, Shareplay
    - Ensure your app's UI elements are drawn within the screen's safe area to avoid collision with rounded corners or notches in the display

- Content Forward - your app is the conduit for the content
    - Ensure you provide all of the appropriate metadata, both in your interface and to the system. Providing this info helps give context to your media and allows the system to provide better experiences in Control Center and the Lock Screen. This includes things like a title and subtitle, a description, thumbnail, season and episode information, or start and end dates for live streams.
    - Always keep your media in its original aspect ratio. This allows the system to position your videos on screen in the correct location. Letter boxing your content can lead to really bad UI experiences 
    - include audio and subtitle tracks for multiple languages so your media is accessible to as many people as possible.

## Visual Intelligence Features

- allowsVideoFrameAnalysis 
- Can copy test out of a video
-  While allowsVideoFrameAnalysis is set to true, and once the media is paused, AVKit will begin analyzing the current video frame after a set period. 
- Note will not analyze frames while scrolling, for performance reasons, or for FairPlay protected content. 
- For more info on how to integrate the visual intelligence feature set into your apps, see our related talks on VisionKit.

## Interstitials 

- As of iOS 16 interstitials are now supported in AVPlayerViewController
-  Interstitials, either in the stream or defined locally through AVPlayerInterstitialEvents, will now be marked along the timeline. When the timeline hits a marker, we'll begin playing the interstitial. If your interstitials are already fully defined within your HLS playlist, you'll get this behavior automatically– no adoption required. If not, or if you app requires some more custom behavior, we're introducing some new API as well. 


```swift
// Creating a skip button for a preroll ad

let eventController = AVPlayerInterstitialEventController(primaryPlayer: mediaPlayer)

// create an interstitial event 
// restricts seeking past interstitial and playing quickly through
let event = AVPlayerInterstitialEvent(primaryItem: interstitialItem, time: .zero)
event.restrictions = [
	.requiresPlaybackAtPreferredRateForAdvancement,
	.constrainsSeekingForwardInPrimaryContent
]

// adds interstitial to VC
eventController.events.append(event)

// uses delegate method to allow e.g. skipping add after 5s
// Note that when adding any custom UI elements to an AVPlayerViewController, such as this ad skip button, always make sure to add to them as subviews of the contentOverlayView.
func playerViewController(playerViewController: AVPlayerViewController, willPresent interstitial: AVInterstitialTimeRange) {
	showSkipButton(afterTime: 5.0, onPress: {
		eventController.cancelCurrentEvent(withResumptionOffset: CMTime.zero)
	})
}
```

Related videos for interstitials
https://developer.apple.com/videos/play/wwdc2022/10145/
https://developer.apple.com/videos/play/wwdc2021/10140

## Playback Speed

Both AVPlayerView and AVPlayerViewController can now optionally show a playback speed menu using some new API we've added.

```swift
// Setting custom playback speeds

let player = AVPlayerViewController()
player.player = // Some AVPlayer

present(player, animated: true)

// localised name for accessibility
let newSpeed = AVPlaybackSpeed(rate: 2.5, localizedName: "Two and a half times speed”)

player.speeds.append(newSpeed)

// you can disable speeds by passing empty [] list of speeds

```

Always call AVPlayer play() to begin playback. Never start playback by calling setRate:1.0, as the selected rate might not be 1.0

## What you get with AVPlayerViewController

<img src="../Local Media/DocumentationMedia/WhatYouGetWithAVKitStandardMediaPlayer.png"/> 

# iOS 17.2 System Media Players Update

I notice as of 17.2 at least (possibly before but not in 16.1) you get an additional controls/ context menu for each individual item (playback speed, languages, subtitles) and with live content when you seek behind the live edge you get a seek to live edge CTA  😍

### iOS 17.2
<img src="../Local Media/DocumentationMedia/iOS17.2_NewAdditionalControls.png"/> 

### iOS 16.1
<img src="../Local Media/DocumentationMedia/iOS16.1_OldAdditionalControlsMenu.png"/> 
