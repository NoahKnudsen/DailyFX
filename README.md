#  Daily FX

### A small sample app containing news stories and market data from the [Daily FX](https://www.dailyfx.com) API. 

#### Design 
The app is comprised of a number of small packages to seperate concerns and encapsulate functionality. These packages are:
* [Foundational](https://github.com/NoahKnudsen/DailyFX/tree/main/Packages/Foundational) - A collection of extensions and augmentations for the Swift Standard Library and Foundation
* [DailyFXService](https://github.com/NoahKnudsen/DailyFX/tree/main/Packages/DailyFXService) - Models and Services to represent and manage Daily FX API data
* [Toolkit](https://github.com/NoahKnudsen/DailyFX/tree/main/Packages/Toolkit) - A UI library containing project-non-specific, resuable UI. 

Additionally all the project-specific UI is contained in the main app project. 

#### SwiftUI 
The app is writen entirely using SwiftUI, with the exception of the very minimal amount of bridging needed in the `SceneDelegate` to support iOS13. This has given me support for iPhone/iPad, dark/light mode, and excellent accessibility, almost out of the box.

The app is essentially an MVVM architecture, however I am finding that in a SwiftUI app of this size, I can get away with using a generic "View Model" (called [`Observable`](https://github.com/NoahKnudsen/DailyFX/blob/ab0a24e94d48795df2460fce038a30cd9d14855c/Packages/Toolkit/Sources/Toolkit/Observable.swift#L8))  that acts purely as a small wrapper around a Model struct to conform it to `ObservableObject` and handle updates from a publisher or stream. I have been greatly enjoying this pattern in a number recent projects as it encourages a very clean seperation between the UI and business logic, making it very straightforward to develop, maintain, and test.  

#### Swift Collections
I have one external package dependency on Apple's [Swift Collections](https://github.com/apple/swift-collections). As you will see, it is an entirely unneccessary dependency that I am using in just [one place](https://github.com/NoahKnudsen/DailyFX/blob/ab0a24e94d48795df2460fce038a30cd9d14855c/DailyFX/Views/NewsStory%2BList.swift#L15) - to improve the [public API](https://github.com/NoahKnudsen/DailyFX/blob/ab0a24e94d48795df2460fce038a30cd9d14855c/DailyFX/Views/Dashboard%2BOverview.swift#L30) of a single `View`. A very similar API could be achieved using a small struct or tuple, but I opted to pull in `OrderedDictionary` to make the call site elegant as possible.      

#### Future improvements

While there is good test coverage for the app's logic, there are currently no tests for the UI. This is something that I would look to improve in the near future, most likely using [PointFree's Snapshot Testing library](https://github.com/pointfreeco/swift-snapshot-testing) which I have enjoyed using in the past.

One bug-bear I have with SwiftUI is that it encourages navigation to be tightly coupled with views. It is possible to decouple it, but due to the timeframe allocated for this task I chose to keep it basic. This would be one of the next architectural pieces that I would tackle if I were to take this app further in any way.    

Hope you enjoy reviewing.
