#
# Be sure to run `pod lib lint CodeFavorites.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CodeFavorites'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CodeFavorites.'
  s.homepage         = 'https://github.com/zitao0206/CCodeFavorites'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zitao0206' => '634376133@qq.com' }
  s.source           = { :git => 'https://github.com/zitao0206/CCodeFavorites.git', :tag => s.version.to_s }
  s.ios.deployment_target = '16.0'
  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '__CUI_MODULE_NAME__=\"CCodeFavorites\" CUI_MODULE_NAME=@\"CCodeFavorites\"'}


  s.source_files = [
    'Classes/**/*'
  ]
  
  s.resource_bundles = {
     'CCodeFavorites' => ['Assets/**/*'],
     'CCodeFavorites-Images' => ['Resources/Images/**/*'],
     'CCodeFavorites-Videos' => ['Resources/Videos/**/*']
  }
#  s.public_header_files = 'CCodeFavorites/Classes/**/*.h'
#  s.prefix_header_file = 'CCodeFavorites.pch'
  s.frameworks = 'UIKit', 'Foundation', 'MapKit'
  s.dependency 'AKOCommonToolsKit'
  s.dependency 'Masonry'
#  s.dependency 'SVProgressHUD'

end
