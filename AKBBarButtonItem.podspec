Pod::Spec.new do |spec|
  spec.name         = "AKBBarButtonItem"
  spec.version      = "0.0.1"
  spec.summary      = "A simple way to create ButtonItem."
  spec.homepage     = "https://github.com/dxinba/AKBBarButtonItem"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author       = { "Huan" => "524684997@qq.com" }
  spec.ios.deployment_target = "8.0"
  spec.source       = { :git => "https://github.com/dxinba/AKBBarButtonItem", :tag => "#{spec.version}" }
  spec.source_files = "AKBBarButtonItem/Source/*.{h,m}"
  spec.frameworks   = 'UIKit', 'Foundation'
end
