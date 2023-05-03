# AutoConstraint

AutoConstraint is a library that simplifies the process of creating layout constraints in iOS apps. It allows you to create constraints in a more declarative way, which can help reduce boilerplate code and make your layout code more readable and maintainable.

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)
- [License](#license)

## Requirements

- iOS 11.0+
- Xcode 10.0+
- Swift 5.0+


## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build AutoConstraint 1.0.0+.

To integrate SnapKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AutoConstraint', '~> 1.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 11+ is required to build SnapKit using Swift Package Manager.

To integrate SnapKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/banjodayo39/AutoConstraint.git", .upToNextMajor(from: "1.0.0"))
]
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate SnapKit into your project manually.

---

## Usage

### Quick Start

```swift
import UIKit
import AutoConstraint

class ViewController: UIViewController {
    
    lazy var testView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(testView)
        testView.backgroundColor = .blue
        testView.centerInSuperview(size: CGSize(width: 300, height: 200))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
```

## Author

banjodayo39@gmail.com, banjodayo39@gmail.com

## License

AutoConstraint is available under the MIT license. See the LICENSE file for more info.
