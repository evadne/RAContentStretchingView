Pod::Spec.new do |s|
  s.name         = "RAContentStretchingView"
  s.version      = "0.0.1"
  s.summary      = "Simple image stretching thru contentRect"
  s.homepage     = "https://github.com/evadne/RAContentStretchingView"
  s.author       = { "Evadne Wu" => "ev@radi.ws" }
  s.source       = { :git => "https://github.com/evadne/RAContentStretchingView.git" }
  s.platform     = :ios, '6.0'
  s.source_files = 'RAContentStretchingView', 'RAContentStretchingView/**/*.{h,m}'
  s.frameworks = 'QuartzCore', 'UIKit'
  s.requires_arc = true
end
