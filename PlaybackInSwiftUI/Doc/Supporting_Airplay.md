# Airplay

WWDC on Airplay Experience: 
https://developer.apple.com/videos/play/wwdc2023/10238/

https://www.wwdcnotes.com/notes/wwdc23/10238/

Intelligent Airplay Support

    Add a new key/value to info.plist and set AVInitialRouteSharingPolicy = LongformAudio

Supporting Airplay

    Identify the audio type: add `AVRoutePickerView`` to your view hierarchy to include an AirPlay picker in your app.
    
    Add an Airplay picker: The picker provides people with a list of potential AirPlay devices that they can use with your app.
    
    Add a media player: `MPNowPlayingInfoCenter`` and `MPRemoteCommandCenter`` to receive remote commands, like play, pause, or skip.
