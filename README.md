RSSExtractor
============
Extract link for RSS article using:
[Extract by Feedbin](https://github.com/feedbin/extract) and [Readability.js by Mozilla](https://github.com/mozilla/readability)

Usage:
------
Using Extract:

```swift
let link = "https://9to5mac.com/2021/12/26/imessage-waiting-for-activation/"
do {
    try await RSSExtractor(host: HOST, username: USERNAME, secret: SECRET).fetch(using: .postlight, with: link)
} catch {}
```

Using Readability:

```swift
let link = "https://9to5mac.com/2021/12/26/imessage-waiting-for-activation/"
do {
    try await RSSExtractor(host: HOST, username: USERNAME, secret: SECRET).fetch(using: .mozilla, with: link)
} catch {}
```
