Pod::Spec.new do |s|
  s.name         = "JCAlertController"
  s.version      = "2.0"
  s.summary      = "a replacement of UIAlertController"
  s.homepage     = "https://github.com/HJaycee/JCAlertView"
  s.license      = "MIT"
  s.author       = { "HJaycee" => "huangxisu@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/HJaycee/JCAlertView.git", :tag => s.version }
  s.source_files  = "JCAlertView", "JCAlertView/JCAlertView/**/*.{h,m}"
  s.frameworks   = 'Accelerate'
  s.requires_arc = true
end
