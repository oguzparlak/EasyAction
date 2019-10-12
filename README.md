# EasyAction

[![Platform](https://img.shields.io/cocoapods/p/LKAlertController.svg?style=flat)](http://cocoapods.org/pods/EasyActionBuilder)
[![License](https://img.shields.io/github/license/oguzparlak/EasyAction)](http://cocoapods.org/pods/EasyActionBuilder)

Building Alerts and ActionSheets had never been so easy!

## Features
* Creates Alerts and ActionSheets with fewer lines of code
* Allows you to build more complex and custom Alerts and ActionSheets

## Installation
EasyAction is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "EasyActionBuilder"
```

## Usage

``` Swift
import EasyActionBuilder
```

### Alert
``` Swift
AlertBuilder(title: "Hello", message: "This is your first action")
    .addAction("OK")
    .show()
```

### Action Sheet
``` Swift
ActionSheetBuilder(title: "", message: "Choose a color")
    .addAction("Red")
    .addAction("Green")
    .addAction("Blue")
    .addAction("Close", style: .cancel)
    .show()
```

## Detailed Usage

### Action Handlers

``` Swift
AlertBuilder(title: "Location", message: "This app needs your permission to use your location")
    .addAction("Allow When using the App", {
        // Handle when using app here
    })
    .addAction("Allow Always", {
        // Handle Always use here
    })
    .addAction("Cancel", style: .cancel)
    .show()
```

### Adding Textfield
``` Swift
AlertBuilder(title: "Password", message: "Enter your Password")
    .addTextField({ (textField) in
        // 1 - Customize your textField in this block
        textField.isSecureTextEntry = true
    })
    .addAction("Login", {
        // 2 - Handle login in this block
    }, textFieldHandler: { (textFields) in
        guard let password: String = textFields?.first?.text else { return }
        // 3 - Validate password in this block
    })
    .addAction("Cancel", style: .cancel)
    .show()

// NOTE: You can only use addTextField method with AlertBuilder
//       With ActionSheetBuilder, It won't work.

```

### Detailed Usage of ActionSheetBuilder
``` Swift
ActionSheetBuilder(title: "Select", message: "Select your favorite singer")
    // 1 - Add Actions
    .addAction("Frank Sinatra", {
        // handle action
    })
    .addAction("Phil Collins", {
        // handle action
    })
    .addAction("Freddie Mercury", {
        // handle action
    })
    // 2 - Set tint color
    .setTintColor(.black)
    .show()
```

### iPad Configurations for ActionSheet

When you want to present your ActionSheet on iPad, the ActionSheet needs to know where It is presenting from. This can be achieved by using `setBarButtonItem` or `setPresentingSource` methods. The app will never crashes if you don't use them. Also you may want to use `show(in: Position)` method. 


``` Swift
ActionSheetBuilder(title: "Add", message: "Add Alarm")
    .addAction("Today")
    .addAction("31 March 2019")
    // Set the presenting source of ActionSheet to navigationBarItem
    .setBarButtonItem(navigationItem.rightBarButtonItem!)
    .show()
```

``` Swift
ActionSheetBuilder(title: "Pop-Up", message: "")
    .addAction("Action 1 ")
    .addAction("Action 2")
    // Set the presenting source of ActionSheet to a UIButton
    .setPresentingSource(myFancyButton)
    .show()
```

``` Swift
ActionSheetBuilder(title: "Picker", message: "Pick something")
    .addAction("1")
    .addAction("2")
    // Shows the ActionSheet at the bottom-center of iPad
    .show(in: .bottom)
```

## Issues Questions and Contributing
Have an issue, or want to request a feature? Create an issue in github.

Want to contribute? Add yourself to the authors list, and create a pull request.

## Author

Oguz Parlak, [oguz.parlak@ozu.edu.tr](mailto:oguz.parlak@ozu.edu.tr)

## License
```
MIT License

Copyright (c) 2019 Oguz Parlak

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
