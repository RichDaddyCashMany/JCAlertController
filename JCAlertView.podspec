Pod::Spec.new do |s|
    s.name         = 'JCAlertView'
    s.version      = '1.0.1'
    s.summary      = 'The easiest way to use pull-to-refresh'
    s.homepage     = 'https://github.com/CoderMJLee/MJRefresh'
    s.license      = 'MIT'
    s.authors      = {'MJ Lee' => '199109106@qq.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/HJaycee/JCAlertView.git', :tag => s.version}
    s.source_files = 'JCAlertView/**/*.{h,m}'
    s.resource     = 'JCAlertView/JCAlertView.bundle'
    s.requires_arc = true
end
