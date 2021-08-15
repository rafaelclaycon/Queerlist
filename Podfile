# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Queerlist' do
  
  use_frameworks!
  
  # Pods for SpellChecker

  target 'QueerlistUITests' do
    pod 'Cucumberish'
  end
  
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
    config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
    config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
  end
end
