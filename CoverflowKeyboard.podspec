Pod::Spec.new do |s|
  s.name             = 'CoverflowKeyboard'
  s.version          = '1.0.0'
  s.summary          = 'CoverflowKeyboard, the Kyboard on steroids'
  s.description      = 'CoverflowKeyboard enables you to create creative and fancy Keyboard coverflows, with multiple styling and sizing options'  
  s.homepage         = 'https://github.com/davidarebuwa/CoverflowKeyboard'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'undeaD_D@live.de' => 'dominic.drees@atino.de' }
  s.source           = { :git => 'https://github.com/davidarebuwa/CoverflowKeyboard.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'Sources/CoverflowKeyboard/Classes/**/*'
  s.swift_version = ['5.0', '5.1', '5.2']
  s.frameworks = 'UIKit'
end
