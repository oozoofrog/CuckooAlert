
# CuckooAlert
> Allow multiple use of presentViewController to UIAlertController.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

You may be disappointed from this. Do you imagine that cuckoo spit out some alerts with beatiful animation?

Sorry.

*Umm, May be later*. But, not now.

This is some codes with swizzle for make UIAlertController multiple using of presentViewController. 


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

in ViewController

        var alert = UIAlertController(title: "title", message: "message", preferredStyle: .Alert)
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        // present first alert controller
        self.presentViewController(alert, animated: true, completion: nil)
        
        alert = UIAlertController(title: "title2", message: "message2", preferredStyle: .Alert)
        alert.addAction(cancel)
        // present second alert controller
        self.presentViewController(alert, animated: true, completion: nil)
        
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("2") {
            // This will be ignored with some Warning:
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
        alert = UIAlertController(title: "title3", message: "message3", preferredStyle: .Alert)
        alert.addAction(cancel)
        // present third alert controller
        self.presentViewController(alert, animated: true, completion: nil)

```

**ObjC**

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [CuckooAlert registCuckooAlert];
    return YES;
}

in ViewController

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:cancel];
    // present first alert controller
    [alert showWithParentViewController:self animated:true completion:nil];
    alert = [UIAlertController alertControllerWithTitle:@"title2" message:@"message2" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:cancel];
    // present second alert controller
    [alert showWithParentViewController:self animated:true completion:nil];
    
    // This will be ignored with some Warning:
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"2"] animated:YES completion:nil];
    
    alert = [UIAlertController alertControllerWithTitle:@"title3" message:@"message3" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:cancel];
    [alert showWithParentViewController:self animated:true completion:nil];
```


seeing *Example*, *ExampleObjc* targets on CuckooAlert projects

## Release History
* 1.0.0
    * add CuckooAlert.swift
    * add CuckooAlert class for enabling swizzles
    * swizzling function of viewDidLoad, viewDidDisappear, presentViewController on UIViewController for management of UIAlertController present queue
    * add some handy function to UIAlertController

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