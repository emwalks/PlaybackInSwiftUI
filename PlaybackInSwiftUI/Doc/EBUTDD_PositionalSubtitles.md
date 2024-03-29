#  EBU-TT-D Positional Subtitles Not Supported in Standard Player

EBU-TT-D subtitles at the BBC are also IMSC 1 Text profile conformant, and Apple does support IMSC, at least in the context of HLS. 

[EBU-TT-D Subtitles](https://tech.ebu.ch/publications/tech3380)
[BBC Subtitles Guidelines](https://www.bbc.co.uk/accessibility/forproducts/guides/subtitles/#Subtitle-Guidelines)

Best "correct" rendering example for the R&D HLS stream from Nigel:
> bbc/imsc.js render, which is probably the best one since it hasn’t been messed with by the dash.js reference player’s CSS:
<img src="../Local Media/DocumentationMedia/bestRenderingForStreamFromNigel.png"/> 

> Formally the regions don’t overlap but I think they’re being deliberately a bit naughty (or testing an edge case deliberately) because the middle region is not big enough and relies on overflow being visible.

Chrome rendering shows some overlap as well: 
<img src="../Local Media/DocumentationMedia/chromeRenderingForStreamFromNigel.png"/> 

Standard AVPlayer Experience - Note Overlap of Content at Bottom
<img src="../Local Media/DocumentationMedia/iPhone15iOS17_2_EBUTTD_StandardAVPlayer.png"/>

Standard AVPlayer Experience - Note Overlap of Content at Bottom
<img src="../Local Media/DocumentationMedia/iPhone15iOS17_2_EBUTTD_StandardAVPlayer2.png"/> 

Toucan Rendering of EBU-TT-D Positional Subtitles in HLS stream
<img src="../Local Media/DocumentationMedia/iPhone15iOS17_2_EBUTTD_Toucan.png"/> 

Toucan Rendering of EBU-TT-D Positional Subtitles in HLS stream
<img src="../Local Media/DocumentationMedia/iPhone15iOS17_2_EBUTTD_Toucan2.png"/> 

[Cookbook Recipie](http://cookbook.tools.bbc.co.uk/iplayer?settings=eyJwcm9kdWN0IjoiaXBsYXllciIsImNvdW50ZXJOYW1lIjoiaXBsYXllci50di5zbXAuY29va2Jvb2sucGFnZSIsImVuYWJsZVRvdWNhbiI6dHJ1ZSwic3VwZXJSZXNwb25zaXZlIjp0cnVlLCJhbGxvd0Nhc3RpbmciOnRydWUsInVpIjp7InVzZUluUGxheWVyR3VpZGFuY2UiOmZhbHNlLCJwbGF5YmFja1NldHRpbmdzUGFuZWwiOnsiZW5hYmxlZCI6dHJ1ZSwiY29udGludW91c1BsYXlTZXR0aW5nIjp0cnVlLCJxdWFsaXR5U2V0dGluZyI6dHJ1ZX19fQ%3D%3D&playlist=eyJ0aXRsZSI6IiIsImhvbGRpbmdJbWFnZVVSTCI6Imh0dHBzOi8vaWNoZWYuYmJjaS5jby51ay9pbWFnZXMvaWMve3JlY2lwZX0vcDBkNTIwY3guanBnIiwiaXRlbXMiOlt7ImtpbmQiOiJwcm9ncmFtbWUiLCJkdXJhdGlvbiI6MzQ4MC4wNCwiaHJlZiI6W3siZm9ybWF0IjoiaGxzIiwidXJsIjoiaHR0cHM6Ly9yZG1lZGlhLmJiYy5jby51ay90ZXN0Y2FyZC9zaW11bGNhc3QvbWFuaWZlc3RzL2F2Yy1mdWxsLm0zdTgifV19XSwiZ3VpZGFuY2UiOiIifQ%3D%3D) to compare correctly supported EBU-TT-D Positional Subtitles. 

Note sizing may be different on Toucan. 

```javaScript
{
  "title": "",
  "holdingImageURL": "https://ichef.bbci.co.uk/images/ic/{recipe}/p0d520cx.jpg",
  "items": [
    {
      "kind": "programme",
      "duration": 3480.04,
      "href": [
        {
          "format": "hls",
          "url": "https://rdmedia.bbc.co.uk/testcard/simulcast/manifests/avc-full.m3u8"
        }
      ]
    }
  ],
  "guidance": ""
}
```

