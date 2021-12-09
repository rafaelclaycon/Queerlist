platform :ios, '13.0'

source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

target 'Queerlist' do
  pod 'SnapKit', '~> 5.0.1'
end

target 'QueerlistUITests' do
  pod 'Cucumberish', '~> 1.4.0'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
    config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
    config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
  end
end
