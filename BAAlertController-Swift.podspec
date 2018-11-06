Pod::Spec.new do |s|
    s.name         = 'BAAlertController-Swift'
    s.version      = '1.0.1'
    s.summary      = 'UIAlertController 的分类，一个 block 搞定系统 alert 和 actionSheet 的 iPhone 和 iPad 版本适配！'
    s.homepage     = 'https://github.com/boai/BAAlertController-Swift'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '9.0'
    s.source       = { :git => 'https://github.com/boai/BAAlertController-Swift.git', :tag => s.version.to_s }
    s.source_files = 'BAAlertController-Swift/BAAlertController-Swift/*.{swift}'
    s.requires_arc = true
end
