#
#  Be sure to run `pod spec lint XBLoginSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|


  spec.name         = "XBLoginSDK"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of XBLoginSDK."

  spec.description  = <<-DESC
                   XB login SDK
                    DESC
  spec.homepage     = "https://github.com/quanliangswift/XBLoginSDK"

  spec.license      = "MIT"

  spec.author             = { "全亮" => "quanliang@xbonline.net" }

    spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/quanliangswift/XBLoginSDK.git", :tag => "#{spec.version}" }


  spec.source_files  = "Classes", "Classes/**/*.{h,m}", "XBLoginSDK/**/*.swift"
  spec.exclude_files = "Classes/Exclude"

    spec.swift_version = '5.0'
    
    spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'OTHER_LDFLAGS' => '-lObjC' }
    spec.frameworks = 'UIKit', 'Foundation'
    spec.dependency "SwiftyJSON"
  spec.dependency "ObjectMapper"
  spec.dependency "Alamofire"

end
