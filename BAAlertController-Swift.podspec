#
# Be sure to run `pod lib lint BAAlertController-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BAAlertController-Swift'
  s.version          = '1.0.1'
  s.summary          = 'swift 版本 UIAlertController 的分类，一个 block 搞定系统 alert 和 actionSheet 的 iPhone 和 iPad 版本适配！'

  s.description      = <<-DESC
                        this is BAAlertController-Swift
                       DESC

  s.homepage         = 'https://github.com/BAHome/BAAlertController-Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'boai' => 'sunboyan@outlook.com' }
  s.source           = { :git => 'https://github.com/BAHome/BAAlertController-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  #s.source_files = 'BAAlertController-Swift/Classes/**/*.swift'
  #s.public_header_files = "BAAlertController-Swift/Classes/**/*.swift"

  s.resource_bundles = {
    'BAAlertController-Swift' => ['BAAlertController-Swift/Resources/Assets.xcassets',
    'BAAlertController-Swift/Resources/**/*.{xib,nib,json,plist}']
  }

  s.public_header_files = 'Pod/Classes/**/*.swift'
  s.frameworks = 'UIKit', 'Foundation'
  
  # s.dependency 'AFNetworking', '~> 2.3'
  #s.dependency "BAButton"

#  s.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => '$(inherited) ***' }

    # Tools
    s.subspec 'BAAlertController-Swift' do |sBAAlertController|
        # sBAAlertController.dependency "BAButton"
        
        sBAAlertController.source_files  = "BAAlertController-Swift/Classes/**/*.{h,m,swift}"
        
        #stool.ios.vendored_frameworks = "iflyMSC.framework"
        sBAAlertController.frameworks = 'UIKit', 'Foundation'
    end
    
# Tools
  s.subspec 'Tools' do |stool|
    # stool.dependency "BATextField"
    
    stool.source_files  = "BAAlertController-Swift/Tools/**/*.{h,m,swift}"

    #stool.ios.vendored_frameworks = "iflyMSC.framework"
    #stool.libraries = "z", "c++", "icucore"
  end
  
end
