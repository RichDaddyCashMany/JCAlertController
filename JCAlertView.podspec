Pod::Spec.new do |s|
  s.name         = "JCAlertView"
  s.version      = "1.0.1"
  s.summary      = "JCAlertView"
  s.homepage     = "https://github.com/HJaycee/JCAlertView"
  s.license      = "MIT"
  s.author       = { "Hjaycee" => "hjaycee@163.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/HJaycee/JCAlertView.git", :commit => '0d21894bea78ec776571bee023cdbc8a2bbfe7c0' }
  s.source_files  = "JCAlertView", "JCAlertView/**/*.{h,m}"
  s.resource  = "JCAlertView/JCAlertView.bundle"
  s.requires_arc = true
end
