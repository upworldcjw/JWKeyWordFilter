
Pod::Spec.new do |s|
  s.name     = 'JWKeyWordFilter'
  s.version  = '0.0.4'
  s.license  = 'MIT'
  s.summary  = 'the fastest way to test a string whera contain key word or replace the keyword with special string'
  s.homepage = 'https://github.com/upworldcjw'
  s.author   = { 'upowrld' => '1042294579@qq.com' }
  s.source   = { :git => 'https://github.com/upworldcjw/JWKeyWordFilter.git', :tag => '0.0.4' }
  s.source_files = 'JWKeyWordFilter/*.{h,m,mm}'
  s.ios.frameworks = 'Foundation', 'UIKit'
  s.ios.deployment_target = '6.0' 
  s.requires_arc = true
  s.library = 'c++'
  s.pod_target_xcconfig = {
       'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
       'CLANG_CXX_LIBRARY' => 'libc++'
  }
end
