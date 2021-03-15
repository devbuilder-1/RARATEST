# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


target 'RARA' do
  use_frameworks!

  pod 'MagicSDK'
  pod 'Alamofire', '~> 5.2'

  # Required for XCFramework
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end

end
