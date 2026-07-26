platform :ios, '15.6'

target 'SwiftTest' do
  # 使用动态 Framework 方式集成三方库
  use_frameworks!

  # Pods for SwiftTest
  pod 'SnapKit'
  pod 'Alamofire'
  pod 'MBProgressHUD', '1.2.0'
  pod 'LookinServer', :subspecs => ['Swift'], :configurations => ['Debug']



  target 'SwiftTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SwiftTestUITests' do
    # Pods for testing
  end
end

# MBProgressHUD 1.2.0 的 podspec 最低版本仍是 iOS 8。
# Xcode 16 已不再提供旧系统使用的 libarclite，因此统一提升 Pods 的最低版本。
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.6'
    end
  end
end
