#
#  Be sure to run `pod spec lint EasyAction.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "EasyAction"
  spec.version      = "0.0.1"
  spec.summary      = "Easy way to create alerts in iOS"
  spec.description  = "You can create alerts easily with EasyAction"
  spec.homepage     = "https://github.com/oguzparlak/EasyAction"
  spec.license      = { :type => "MIT", :text => "MIT License. Copyright (c) 2019 Oguz Parlak" }
  spec.author       = { "Oguz Parlak" => "oguz.parlak@ozu.edu.tr" }
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = "9.0"
  spec.source       = { :git => "https://github.com/oguzparlak/EasyAction.git", :tag => spec.version.to_s }
  spec.source_files  = "EasyAction", "~/**/*"
  spec.frameworks = "UIKit"
  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end