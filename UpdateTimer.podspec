Pod::Spec.new do |s|
  s.name = 'UpdateTimer'
  s.version = '0.0.1'
  s.license = 'WTFPL'
  s.summary = 'Scene loop timer for keeping nodes in your scene graph in sync (works with SpriteKit, etc.)'
  s.authors = { 'bryn austin bellomy' => 'bryn.bellomy@gmail.com' }
  s.license = { :type => 'WTFPL', :file => 'LICENSE.md' }
  s.homepage = 'https://github.com/brynbellomy/UpdateTimer'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source_files = 'Classes/*.swift'
  s.requires_arc = true

  s.source = { :git => 'https://github.com/brynbellomy/UpdateTimer.git', :tag => s.version }
end
