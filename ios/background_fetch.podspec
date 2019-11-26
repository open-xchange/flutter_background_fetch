#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'background_fetch'
  s.version          = '0.1.0'
  s.summary          = 'Periodic callbacks in the background for both IOS and Android.'
  s.description      = <<-DESC
  Periodic callbacks in the background for both IOS and Android.
DESC
  s.homepage         = 'https://github.com/open-xchange/flutter_background_fetch'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Open-Xchange GmbH' => 'info@open-xchange.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  
  s.dependency 'Flutter'
  s.dependency 'SwiftyBeaver'

  s.ios.deployment_target = '13.0'
end

