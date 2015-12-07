Pod::Spec.new do |s|
  s.name         = "JCAlertView"
  s.version      = "1.1.5"
  s.summary      = "The easiest way to use alertView"
  s.homepage     = "https://github.com/HJaycee/JCAlertView"
  s.license      = "MIT"
  s.author       = { "Hjaycee" => "hjaycee@163.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/HJaycee/JCAlertView.git", :tag => s.version }
  s.source_files  = "JCAlertView", "JCAlertView/**/*.{h,m}"
  s.resource  = "JCAlertView/JCAlertView.bundle"
  s.frameworks   = 'Accelerate'
  s.requires_arc = true
end
