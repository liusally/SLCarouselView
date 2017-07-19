

This library provides an carousel view can be used to create Instagram carousel-like view or e-commerce product image slideshow. 

## Features

- [x] Display a carousel view with images, vidoes or other customized views.
- [x] Use auto layout, easy to use.
- [x] This view is built for the simple case of using scrollview with page control, easy to revise based on your own needs.

## What the Carousel View DOESN'T DO

- Add or remove view from carousel during run time.
- Customize the size of view within the carousel view. 
- Customize the position of page control.

Note: this view is built for being used across a few of my own projects, if anyone finds it useful and want to tune it for their own project, feel free to ask questions.

## Requirements

- iOS 8.0 or later
- Language: Swift

#### Backwards compatibility

- Not tested yet, mainly depending on PureLayout compatibility.

## Getting Started

- Read this Readme doc
- Read the [How to use section](https://github.com/liusally/SLCarouselView#how-to-use)
- Try the example by downloading the project from Github 
- Get to the [installation steps](https://github.com/liusally/SLCarouselView#installation)

## How To Use

```swift

import SLCarouselView

let imageView = UIImageView()
self.carouselView.appendContent(view: imageView)
```

- For details about how to add images and videos to the carousel, see `Examples/SLCarouselViewExample`

## Installation

There are two ways to use SDWebImage in your project:
- using CocoaPods
- by copy `SLCarouselView.swift` into your repository

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

#### Podfile
```
platform :ios, '8.0'
use_frameworks!

pod 'SLCarouselView', :git => 'https://github.com/liusally/SLCarouselView.git'
```

## License

All source code is licensed under the [MIT License](https://raw.githubusercontent.com/liusally/SLCarouselView/master/LICENSE).
