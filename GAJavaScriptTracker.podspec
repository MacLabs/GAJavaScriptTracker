Pod::Spec.new do |s|
  s.name         = "GAJavaScriptTracker"
  s.version      = "0.0.1"
  s.summary      = "Objective-C Cocoa Wrapper for javascript google analytics tracking on OSX."
  s.homepage     = "https://github.com/MacLabs/GAJavaScriptTracker"
  s.license      = 'LICENCE*.*'
  s.author       = { "Dominik Pich" => "Dominik@pich.info" }
  s.source       = { :git => "https://github.com/MacLabs/GAJavaScriptTracker.git", :tag => "0.0.1" }
  s.platform     = :osx
  s.source_files = 'GAJavaScriptTracker/**/*.{h,m}'
  s.resource   = 'GAJavaScriptTracker/**/*.{js,html}'
  # s.exclude_files = 'Classes/Exclude'
  s.framework    = 'Webkit'
  s.public_header_files = 'GAJavaScriptTracker/**/*.h'
  s.requires_arc = true
end
