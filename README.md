
# CuckooAlert
> Make UIAlertController using continusously with method swizzle.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

You may be disappointed from this. Do you imagine that cuckoo spit out some alerts with beatiful animation?

Sorry.

*Umm, May be later*. But, not now.

This is do with swizzle and make UIAlertController with presentViewController seems to old UIAlertView.


## Requirements

- iOS 8.4+
- Xcode 7.3

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `CuckooAlert` by adding it to your `Podfile`:

```ruby
platform :ios, '8.4'
use_frameworks!
pod 'CuckooAlert'
```

To get the full benefits import `CuckooAlert` wherever you import UIKit

``` swift
import UIKit
import CuckooAlert
```
#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/CuckooAlert.framework` to an iOS project.

```
github "singcodes/CuckooAlert"
```
#### Manually
1. Download and drop ```CuckooAlert.swift``` in your project.  
2. Congratulations!  

## Usage example

**Swift**

```swift
import CuckooAlert

in AppDeleaget launching

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        CuckooAlert.registCuckooAlert()
        return true
}

```

**ObjC**

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [CuckooAlert registCuckooAlert];
    return YES;
}
```

and just use presentViewController with UIAlertController

no more error with presenting multiple alert controller.

seeing *Example*, *ExampleObjc* targets on CuckooAlert projects

## Release History
* 0.0.1
    * Work in progress

## Contribute

I would love for you to contribute or modifying or copy and anything to **CuckooAlert**, check the ``LICENSE`` file for more info.

## Meta

singcodes – [@KwanghoonChoi](https://twitter.com/KwanghoonChoi) – eyerama@gmail.com

Distributed under the BSD(3-clause) license. See ``LICENSE`` for more information.

[https://github.com/singcodes](https://github.com/singcodes/)

[swift-image]:https://img.shields.io/badge/swift-2.2-orange.svg
[swift-url]: https://swift.org/
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com